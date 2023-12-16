import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bird/game/flappy_bird_game.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(GameWidget(
    game: game,
  ));
}
