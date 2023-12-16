import 'package:flame/components.dart';
import 'package:flutter_bird/game/assets.dart';
import 'package:flutter_bird/game/bird_movement.dart';
import 'package:flutter_bird/game/flappy_bird_game.dart';

class Bird extends SpriteGroupComponent<BirdMoment>
    with HasGameRef<FlappyBirdGame> {
  Bird();

  @override
  Future<void> onLoad() async {
    final birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = BirdMoment.middle;
    sprites = {
      BirdMoment.middle: birdMidFlap,
      BirdMoment.up: birdUpFlap,
      BirdMoment.down: birdDownFlap
    };
  }
}
