import 'dart:convert' as convert;

import 'package:bonus_tasks/api_project/models/dog_api_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class DogApiNotifier extends StateNotifier<DogApiState> {
  DogApiNotifier() : super(const DogApiState()) {
    loadBreeds();
  }

  Future<void> loadBreeds() async {
    state = state.copyWith(isLoading: true);
    final uri = Uri.parse('https://dog.ceo/api/breeds/list/all');
    try {
      final response = await http.get(uri);
      final json = convert.jsonDecode(response.body);
      final map = json['message'] as Map<String, dynamic>;
      state = state.copyWith(breeds: map.keys.toList(), isLoading: false);
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> loadImagesForBreed() async {
    if (state.selectedBreed == null) return;
    state = state.copyWith(isLoading: true);
    final uri = Uri.parse('https://dog.ceo/api/breed/${state.selectedBreed}/images');
    try {
      final response = await http.get(uri);
      final json = convert.jsonDecode(response.body);
      state = state.copyWith(imagePathList: List<String>.from(json['message']), isLoading: false);
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> loadRandomImage() async {
    state = state.copyWith(isLoading: true);
    final uri = Uri.parse('https://dog.ceo/api/breeds/image/random');
    try {
      final response = await http.get(uri);
      final json = convert.jsonDecode(response.body);
      state = state.copyWith(imagePath: json['message'], isLoading: false);
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> getRandomImage() async {
    if (state.selectedBreed == null) {
      await loadRandomImage();
      return;
    }
    if (state.imagePathList.isEmpty) {
      await loadImagesForBreed();
    }
    if (state.imagePathList.isNotEmpty) {
      final newImagePath = (List<String>.from(state.imagePathList)..shuffle()).first;
      state = state.copyWith(imagePath: newImagePath);
    }
  }

  void setSelectedBreed(String? breed) {
    if (breed == '') {
      state = state.copyWith(selectedBreed: null, clearSelectedBreed: true, imagePathList: []);
    } else {
      state = state.copyWith(selectedBreed: breed, imagePathList: []);
    }
  }
}

final dogApiNotifierProvider = StateNotifierProvider<DogApiNotifier, DogApiState>((ref) {
  return DogApiNotifier();
});
