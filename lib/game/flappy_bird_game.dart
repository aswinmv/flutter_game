import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bird/components/background.dart';
import 'package:flutter_bird/components/bird.dart';
import 'package:flutter_bird/components/ground.dart';
import 'package:flutter_bird/components/pipe_group.dart';
import 'package:flutter_bird/game/config.dart';
import 'package:google_fonts/google_fonts.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
      score = buildScore(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
        text: "Score : 0",
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center,
        textRenderer: TextPaint(
            style: GoogleFonts.pressStart2p(
                fontSize: 20, fontWeight: FontWeight.w500)));
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = "Score: ${bird.score}";
  }
}
