import 'dart:math' as math;

import 'package:bonus_tasks/jp_project/screens/splash_screen/widgets/splash_card.dart';
import 'package:bonus_tasks/jp_project/widgets/blur_container.dart';
import 'package:flutter/material.dart';

// Winkel Berechnung für Schriftzug mit Opacity
const radians = -30 * (math.pi / 180);
Alignment begin = Alignment(math.cos(radians + math.pi), math.sin(radians + math.pi));
Alignment end = Alignment(math.cos(radians), math.sin(radians));

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/bg_startscreen.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 145,
            left: 0,
            child: Transform.scale(scale: 1.15, child: Image.asset('assets/images/cupcake_chick.png')),
          ),
          Positioned(
            bottom: 115,
            left: 0,
            right: 0,
            child: Opacity(opacity: 0.25, child: Image.asset('assets/images/snack_snack.png', fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 115,
            left: 0,
            right: 0,
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                begin: begin,
                end: end,
                colors: [Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.25), Colors.black],
                stops: [0.3, 0.33],
              ).createShader(bounds),
              blendMode: BlendMode.dstIn, // zeigt das Bild nur dort, wo der Verlauf deckend ist
              child: Image.asset('assets/images/snack_snack.png', fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 90,
            child: BlurContainer(
              content: SplashCard(),
              blur: 30,
              width: 360,
              height: 230,
              padding: EdgeInsets.all(30),
              color: Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.01),
              borderColorAlpha: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
