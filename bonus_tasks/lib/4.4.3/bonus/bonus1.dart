import 'package:flutter/material.dart';

class Bonus1In443 extends StatefulWidget {
  const Bonus1In443({super.key});

  @override
  State<Bonus1In443> createState() => _Bonus1In443State();
}

class _Bonus1In443State extends State<Bonus1In443> {
  double rating = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          Slider(
            min: 1,
            max: 5,
            divisions: 4,
            value: rating,
            onChanged: (newRating) {
              setState(() => rating = newRating);
            },
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.amber,
              child: Text(
                'Flex: 1',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: rating.toInt(),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.blueGrey,
              child: Text(
                'Flex: ${rating.toInt()}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.amber,
              child: Text(
                'Flex: 1',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
