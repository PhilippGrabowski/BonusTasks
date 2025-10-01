import 'package:bonus_tasks/jp_project/data/mock_data.dart';
import 'package:bonus_tasks/jp_project/models/category_filter.dart';
import 'package:bonus_tasks/jp_project/models/snack.dart';
import 'package:bonus_tasks/jp_project/widgets/blur_container.dart';
import 'package:flutter/material.dart';

class ChipList extends StatefulWidget {
  const ChipList({super.key, required this.onFilter});

  final void Function() onFilter;

  @override
  State<ChipList> createState() => _ChipListState();
}

class _ChipListState extends State<ChipList> {
  void _toggleAllCategories() {
    if (categoryFilter.map((cf) => cf.filter).contains(false)) {
      setState(() {
        for (CategoryFilter cf in categoryFilter) {
          cf.setFilter(true);
        }
      });
    } else {
      setState(() {
        for (CategoryFilter cf in categoryFilter) {
          cf.setFilter(false);
        }
      });
    }
    widget.onFilter();
  }

  _toggleCategory(int index) {
    setState(() {
      categoryFilter[index].toggleFilter();
    });
    widget.onFilter();
  }

  String _firstLetterToUpperCase(String value) {
    return value[0].toUpperCase() + value.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    Widget chipContent = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(opacity: 0.6, child: Image.asset('assets/images/icons/Lunch.png', width: 14, height: 14)),
        const SizedBox(width: 4),
        Text(
          'All categories',
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: Color.fromARGB(255, 235, 235, 245).withValues(alpha: 0.6)),
        ),
        Icon(Icons.keyboard_arrow_down, color: Colors.white.withValues(alpha: 0.6)),
      ],
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          GestureDetector(
            onTap: () => _toggleAllCategories(),
            child: BlurContainer(
              content: chipContent,
              blur: 60,
              width: 150,
              height: 45,
              padding: EdgeInsets.all(0),
              color: Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.2),
              borderColorAlpha: 0.5,
              gradient: LinearGradient(colors: [Colors.black, Colors.white], stops: [0.2, 0.6]),
            ),
          ),

          ...List.generate(
            categoryFilter.length,
            (index) => GestureDetector(
              onTap: () => _toggleCategory(index),
              child: BlurContainer(
                blur: 60,
                width: 90,
                height: 45,
                padding: EdgeInsets.all(0),
                color: Color.fromARGB(255, 255, 255, 255).withValues(alpha: categoryFilter[index].filter ? 0.6 : 0.15),
                borderColorAlpha: 0.5,
                content: Text(
                  _firstLetterToUpperCase(categoryFilter[index].category.name),
                  style: categoryFilter[index].filter
                      ? Theme.of(
                          context,
                        ).textTheme.labelMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.bold)
                      : Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Color.fromARGB(255, 235, 235, 245).withValues(alpha: 0.6),
                        ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
