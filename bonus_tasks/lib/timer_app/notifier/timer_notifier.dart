import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerState {
  const TimerState({required this.input, required this.seconds, required this.isRunning});

  final int input;
  final int seconds;
  final bool isRunning;

  TimerState copyWith({int? input, int? seconds, bool? isRunning}) {
    return TimerState(
      input: input ?? this.input,
      seconds: seconds ?? this.seconds,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}

class TimerNotifier extends Notifier<TimerState> {
  Timer? _timer;

  @override
  TimerState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return const TimerState(input: 0, seconds: 0, isRunning: false);
  }

  void setTimer(int seconds) {
    if (!state.isRunning) {
      state = state.copyWith(input: seconds, seconds: seconds);
    }
  }

  void startTimer() {
    if (state.isRunning || state.seconds <= 0) return;
    state = state.copyWith(isRunning: true);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.seconds > 0) {
        state = state.copyWith(seconds: state.seconds - 1);
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    state = state.copyWith(isRunning: false);
  }

  String timerOutput() {
    int minutes = state.seconds ~/ 60;
    int seconds = state.seconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }
}

final timerNotifierProvider = NotifierProvider<TimerNotifier, TimerState>(TimerNotifier.new);
