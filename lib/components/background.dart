import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter_bird/game/assets.dart';
import 'package:flutter_bird/game/flappy_bird_game.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final backgorund = await Flame.images.load(Assets.backgorund);
    size = gameRef.size;
    sprite = Sprite(backgorund);
  }
}
