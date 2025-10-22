import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class StopwatchState {
  const StopwatchState({required this.milliSeconds, required this.isRunning});

  final int milliSeconds;
  final bool isRunning;

  StopwatchState copyWith({int? milliSeconds, bool? isRunning}) {
    return StopwatchState(milliSeconds: milliSeconds ?? this.milliSeconds, isRunning: isRunning ?? this.isRunning);
  }
}

class StopwatchNotifier extends Notifier<StopwatchState> {
  Timer? _timer;

  @override
  StopwatchState build() {
    ref.onDispose(() => _timer?.cancel());
    return const StopwatchState(milliSeconds: 0, isRunning: false);
  }

  void startStopwatch() {
    if (state.isRunning) return;
    state = state.copyWith(isRunning: true);
    _timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      state = state.copyWith(milliSeconds: state.milliSeconds + 10);
    });
  }

  void stopStopwatch() {
    _timer?.cancel();
    state = state.copyWith(isRunning: false);
  }

  void resetStopwatch() {
    _timer?.cancel();
    state = const StopwatchState(milliSeconds: 0, isRunning: false);
  }

  String stopwatchOutput() {
    int minutes = state.milliSeconds ~/ 60000;
    int seconds = (state.milliSeconds ~/ 1000) % 60;
    int milliSeconds = (state.milliSeconds % 1000) ~/ 10;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    String milliSecondsStr = milliSeconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr:$milliSecondsStr';
  }
}

final stopwatchNotifierProvider = NotifierProvider<StopwatchNotifier, StopwatchState>(StopwatchNotifier.new);
