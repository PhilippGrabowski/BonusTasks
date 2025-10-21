import 'package:bonus_tasks/timer_app/notifier/timer_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerWidget extends ConsumerStatefulWidget {
  const TimerWidget({super.key});

  @override
  ConsumerState<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends ConsumerState<TimerWidget> {
  late final TextEditingController controller;
  final FocusNode textFieldFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timerState = ref.watch(timerNotifierProvider);
    final timerNotifier = ref.read(timerNotifierProvider.notifier);

    ref.listen(timerNotifierProvider, (previous, next) {
      if (previous != null && previous.seconds > 0 && next.seconds == 0 && previous.isRunning) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Timer von ${controller.text} Sekunden ist abgelaufen', textAlign: TextAlign.center),
            duration: Duration(seconds: 2),
          ),
        );
        controller.clear();
      }
    });

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 30,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 150,
              child: TextField(
                readOnly: timerState.isRunning,
                controller: controller,
                focusNode: textFieldFocus,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                  labelText: 'Sekundenangabe',
                  hintText: 'max 5999',
                  counter: SizedBox.shrink(),
                ),
                maxLength: 4,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly, _MinMaxValueFormatter(1, 5999)],
                onChanged: (value) => timerNotifier.setSeconds(int.tryParse(value) ?? 0),
              ),
            ),
            Text(
              timerNotifier.timerOutput(),
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
              ),
            ),
            FilledButton(
              onPressed: controller.text.isEmpty
                  ? null
                  : timerState.isRunning
                  ? timerNotifier.stopTimer
                  : () {
                      textFieldFocus.unfocus();
                      timerNotifier.startTimer();
                    },
              child: timerState.isRunning ? Text('Stopp') : Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MinMaxValueFormatter extends TextInputFormatter {
  _MinMaxValueFormatter(this.minValue, this.maxValue);

  final int minValue;
  final int maxValue;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) return newValue;
    final value = int.tryParse(newValue.text);
    if (value == null) return oldValue;
    if (value < minValue || value > maxValue) {
      return oldValue;
    }
    return newValue;
  }
}
