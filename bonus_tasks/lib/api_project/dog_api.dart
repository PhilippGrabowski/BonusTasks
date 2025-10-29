import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DogApi extends StatefulWidget {
  const DogApi({super.key});

  @override
  State<DogApi> createState() => _DogApiState();
}

class _DogApiState extends State<DogApi> {
  List<String> breeds = [];
  String? selectedBreed;
  List<String> imagePathList = [];
  String? imagePath;

  @override
  void initState() {
    super.initState();
    loadBreeds();
  }

  Future<void> loadBreeds() async {
    final uri = Uri.parse('https://dog.ceo/api/breeds/list/all');
    try {
      final response = await http.get(uri);
      final json = convert.jsonDecode(response.body);
      final map = json['message'] as Map<String, dynamic>;
      setState(() => breeds = map.keys.toList());
    } catch (_) {}
  }

  Future<void> loadImagesForBreed() async {
    if (selectedBreed == null) return;
    final uri = Uri.parse('https://dog.ceo/api/breed/$selectedBreed/images');
    try {
      final response = await http.get(uri);
      final json = convert.jsonDecode(response.body);
      setState(() => imagePathList = List<String>.from(json['message']));
    } catch (_) {}
  }

  Future<void> loadRandomImage() async {
    final uri = Uri.parse('https://dog.ceo/api/breeds/image/random');
    try {
      final response = await http.get(uri);
      final json = convert.jsonDecode(response.body);
      setState(() => imagePath = json['message']);
    } catch (_) {}
  }

  Future<void> getRandomImage() async {
    if (selectedBreed == null) {
      loadRandomImage();
      return;
    }
    if (imagePathList.isEmpty) {
      await loadImagesForBreed();
    }
    if (imagePathList.isNotEmpty) {
      setState(() => imagePath = (imagePathList..shuffle()).first);
    }
  }

  String getBreed(String name) {
    return name[0].toUpperCase() + name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Dog API')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            DropdownMenu<String>(
              initialSelection: selectedBreed,
              hintText: 'Select breed',
              menuHeight: 200,
              onSelected: (value) => setState(() {
                selectedBreed = value == '' ? null : value;
                imagePathList = [];
              }),
              dropdownMenuEntries: [
                DropdownMenuEntry<String>(value: '', label: 'Select breed'),
                ...breeds.map((breed) {
                  return DropdownMenuEntry<String>(value: breed, label: getBreed(breed));
                }),
              ],
            ),
            SizedBox(height: 20),
            FilledButton(onPressed: getRandomImage, child: Text('Get Random Dog')),
            SizedBox(height: 40),
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5)),
              ),
              child: imagePath == null
                  ? Center(child: Text('Press Button to load Image'))
                  : Image.network(imagePath!, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
