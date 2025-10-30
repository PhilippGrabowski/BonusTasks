import 'package:flutter/material.dart';

@immutable
class DogApiState {
  final List<String> breeds;
  final String? selectedBreed;
  final String? imagePath;
  final bool isLoading;

  const DogApiState({this.breeds = const [], this.selectedBreed, this.imagePath, this.isLoading = false});

  DogApiState copyWith({
    List<String>? breeds,
    String? selectedBreed,
    bool clearSelectedBreed = false,
    String? imagePath,
    bool? isLoading,
  }) {
    return DogApiState(
      breeds: breeds ?? this.breeds,
      selectedBreed: clearSelectedBreed ? null : selectedBreed ?? this.selectedBreed,
      imagePath: imagePath ?? this.imagePath,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
