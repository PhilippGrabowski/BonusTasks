import 'package:bonus_tasks/jp_project/data/mock_data.dart';

class Snack {
  final String name;
  final String detail;
  final String imagePath;
  final List<Category> categories;
  final List<double> priceList;
  bool isFavorite = false;
  int likes;
  final int reviews;

  Snack({
    required this.name,
    required this.detail,
    required this.imagePath,
    required this.categories,
    required this.priceList,
    required this.likes,
    required this.reviews,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    isFavorite ? likes++ : likes--;
  }
}
