import 'package:flutter/material.dart';

final Map<int, int> counters = {0: 0, 1: 0, 2: 0};

class Bonus1 extends StatefulWidget {
  const Bonus1({super.key});

  @override
  State<Bonus1> createState() => _Bonus1State();
}

class _Bonus1State extends State<Bonus1> {
  int _navigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_navigationIndex == 0 ? 'Counters' : 'Summe'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _navigationIndex,
        onDestinationSelected: (index) {
          setState(() {
            _navigationIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.ads_click),
            icon: Icon(Icons.ads_click_outlined),
            label: 'Counters',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.functions),
            icon: Icon(Icons.functions_outlined),
            label: 'Summe',
          ),
        ],
      ),
      body: IndexedStack(
        index: _navigationIndex,
        children: [CountersScreen(), SumScreen()],
      ),
    );
  }
}

class CountersScreen extends StatefulWidget {
  const CountersScreen({super.key});

  @override
  State<CountersScreen> createState() => _CountersScreenState();
}

class _CountersScreenState extends State<CountersScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
          for (int i = 0; i < counters.entries.length; i++)
            GestureDetector(
              onTap: () {
                setState(() {
                  counters[i] = counters[i]! + 1;
                });
              },
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                width: 300,
                height: 150,
                alignment: Alignment.center,
                child: Text(
                  'Clicks : ${counters[i]}',
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                counters.forEach((key, value) => counters[key] = 0);
              });
            },
            child: Text('Reset'),
          ),
        ],
      ),
    );
  }
}

class SumScreen extends StatefulWidget {
  const SumScreen({super.key});

  @override
  State<SumScreen> createState() => _SumScreenState();
}

class _SumScreenState extends State<SumScreen> {
  int get sum => counters.values.reduce((value, element) => value + element);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Summe: $sum',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
