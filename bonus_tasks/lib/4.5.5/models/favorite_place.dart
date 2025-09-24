import 'package:intl/intl.dart';

class FavoritePlace {
  final String title;
  final DateTime date;
  final String description;
  final String imageUrl;

  const FavoritePlace({
    required this.title,
    required this.date,
    required this.description,
    required this.imageUrl,
  });

  String get formattedDate => DateFormat('dd.MM.yyyy').format(date);
}
