import 'package:bonus_tasks/jp_project/data/mock_data.dart';

class CategoryFilter {
  final Category category;
  bool filter = false;

  CategoryFilter(this.category);

  void toggleFilter() {
    filter = !filter;
  }

  void setFilter(bool value) {
    filter = value;
  }
}
