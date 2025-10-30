import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dogApiServiceProvider = Provider((ref) => DogApiService());

class DogApiService {
  final String _baseUrl = 'https://dog.ceo/api';

  Future<List<String>> fetchBreeds() async {
    final uri = Uri.parse('$_baseUrl/breeds/list/all');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = convert.jsonDecode(response.body);
        final map = json['message'] as Map<String, dynamic>;
        return map.keys.toList();
      } else {
        throw Exception('Failed to load breeds');
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<String> fetchRandomImage(String? breed) async {
    final uri = breed == null
        ? Uri.parse('$_baseUrl/breeds/image/random')
        : Uri.parse('$_baseUrl/breed/$breed/images/random');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = convert.jsonDecode(response.body);
        return json['message'] as String;
      } else {
        throw Exception('Failed to load random image');
      }
    } catch (_) {
      rethrow;
    }
  }
}
