import 'package:bonus_tasks/api_project/models/dog_api_state.dart';
import 'package:bonus_tasks/api_project/services/dog_api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dogApiNotifierProvider = StateNotifierProvider<DogApiNotifier, DogApiState>((ref) {
  final apiService = ref.watch(dogApiServiceProvider);
  return DogApiNotifier(apiService);
});

class DogApiNotifier extends StateNotifier<DogApiState> {
  DogApiNotifier(this._dogApiService) : super(const DogApiState()) {
    loadBreeds();
  }

  final DogApiService _dogApiService;

  Future<void> loadBreeds() async {
    state = state.copyWith(isLoading: true);
    try {
      final breeds = await _dogApiService.fetchBreeds();
      state = state.copyWith(breeds: breeds, isLoading: false);
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> loadRandomImage() async {
    state = state.copyWith(isLoading: true);
    try {
      final imagePath = await _dogApiService.fetchRandomImage(state.selectedBreed);
      state = state.copyWith(imagePath: imagePath, isLoading: false);
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  void setSelectedBreed(String? breed) {
    if (breed == null || breed.isEmpty) {
      state = state.copyWith(selectedBreed: null, clearSelectedBreed: true);
    } else {
      state = state.copyWith(selectedBreed: breed);
    }
  }
}
