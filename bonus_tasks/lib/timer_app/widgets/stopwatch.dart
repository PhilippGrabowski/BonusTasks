import 'package:bonus_tasks/timer_app/notifier/stopwatch_notifier.dart';
import 'package:bonus_tasks/timer_app/notifier/timer_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StopwatchWidget extends ConsumerWidget {
  const StopwatchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stopwatchState = ref.watch(stopwatchNotifierProvider);
    final stopwatchNotifier = ref.read(stopwatchNotifierProvider.notifier);

    ref.listen(timerNotifierProvider, (previous, next) {
      if (previous != null && previous.seconds > 0 && next.seconds == 0 && previous.isRunning) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Timer von ${previous.input} Sekunden ist abgelaufen', textAlign: TextAlign.center),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 30,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              stopwatchNotifier.stopwatchOutput(),
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
              ),
            ),
            Row(
              spacing: 40,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: stopwatchNotifier.resetStopwatch, child: Text('Zurücksetzen')),
                FilledButton(
                  onPressed: stopwatchState.isRunning
                      ? stopwatchNotifier.stopStopwatch
                      : stopwatchNotifier.startStopwatch,
                  child: stopwatchState.isRunning ? Text('Stopp') : Text('Start'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
