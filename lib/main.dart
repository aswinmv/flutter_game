import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bird/game/flappy_bird_game.dart';
import 'package:flutter_bird/screens/game_over.dart';
import 'package:flutter_bird/screens/main_menu_screen.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const [MainMenuScreen.id],
    overlayBuilderMap: {
      "mainMenu": (context, _) => MainMenuScreen(game: game),
      "gameOver": (context, _) => GameOver(game: game),
    },
  ));
}
