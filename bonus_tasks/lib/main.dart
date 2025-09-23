import 'package:bonus_tasks/4.4.2/bonus/bonus1.dart';
import 'package:bonus_tasks/4.4.3/aufgabe1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bonus Tasks',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 82, 34, 133),
        ),
      ),
      // home: const Bonus1(),
      home: const Aufgabe1In443(),
    );
  }
}
