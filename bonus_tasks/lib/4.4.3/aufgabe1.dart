import 'package:flutter/material.dart';

class Aufgabe1In443 extends StatelessWidget {
  const Aufgabe1In443({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.red, Colors.white, Colors.green],
                  ).createShader(bounds);
                },
                child: Text(
                  'Willkommen zur App!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 3)],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Image.network(
              'https://www.gebeco.de/wp-content/uploads/2024/09/Mexiko_Palenque-Tempel_HeS.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.center,
              child: Text(
                'Mexiko begeistert mit einer unglaublichen Vielfalt an Kultur, Geschichte und Natur. Von den beeindruckenden Ruinen der Maya und Azteken über die Halbinsel Yucatán bis zu den modernen Metropolen.',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
