import 'package:flutter/material.dart';
import 'package:flutter_bird/game/assets.dart';
import 'package:flutter_bird/game/flappy_bird_game.dart';
import 'package:google_fonts/google_fonts.dart';

class GameOver extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = "gameOver";
  const GameOver({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black38,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            Text("Score : ${game.bird.score}",
                style: GoogleFonts.pressStart2p(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.orange)),
            const SizedBox(
              height: 15,
            ),
            Image.asset(Assets.gameOver),
            ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text(
                  "Restart",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
            const Spacer()
          ]),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove("gameOver");
    game.resumeEngine();
  }
}
