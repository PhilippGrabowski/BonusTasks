import 'package:bonus_tasks/timer_app/widgets/stopwatch.dart';
import 'package:bonus_tasks/timer_app/widgets/timer.dart';
import 'package:flutter/material.dart';

class TimerAppScreen extends StatefulWidget {
  const TimerAppScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TimerAppScreenState();
  }
}

class _TimerAppScreenState extends State<TimerAppScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: selectedIndex == 0 ? Text('Timer') : Text('Stoppuhr')),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(() => selectedIndex = value),
        destinations: [
          NavigationDestination(selectedIcon: Icon(Icons.timer), icon: Icon(Icons.timer_outlined), label: 'Timer'),
          NavigationDestination(selectedIcon: Icon(Icons.watch), icon: Icon(Icons.watch_outlined), label: 'Stoppuhr'),
        ],
      ),
      body: SafeArea(child: selectedIndex == 0 ? TimerWidget() : StopwatchWidget()),
    );
  }
}
