import 'package:bonus_tasks/api_project/notifier/dog_api_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DogApi extends ConsumerWidget {
  const DogApi({super.key});

  String getBreed(String name) {
    return name[0].toUpperCase() + name.substring(1);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dogApiState = ref.watch(dogApiNotifierProvider);
    final dogApiNotifier = ref.read(dogApiNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Dog API')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            DropdownMenu<String>(
              initialSelection: dogApiState.selectedBreed,
              hintText: 'Select breed',
              menuHeight: 200,
              onSelected: (value) => dogApiNotifier.setSelectedBreed(value),
              dropdownMenuEntries: [
                DropdownMenuEntry<String>(value: '', label: '--Select--'),
                ...dogApiState.breeds.map((breed) {
                  return DropdownMenuEntry<String>(value: breed, label: getBreed(breed));
                }),
              ],
            ),
            SizedBox(height: 80),
            Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5)),
              ),
              child: dogApiState.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : dogApiState.imagePath == null
                  ? const Center(child: Text('Press Button to load Image'))
                  : Image.network(dogApiState.imagePath!, fit: BoxFit.cover),
            ),
            SizedBox(height: 40),
            FilledButton(onPressed: dogApiNotifier.getRandomImage, child: Text('Get Random Dog')),
          ],
        ),
      ),
    );
  }
}
