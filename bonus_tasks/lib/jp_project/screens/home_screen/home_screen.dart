import 'package:bonus_tasks/jp_project/data/mock_data.dart';
import 'package:bonus_tasks/jp_project/models/snack.dart';
import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/burger_blur_card.dart';
import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/chip_list.dart';
import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/snack_info_carousel/snack_info_carousel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Snack> filteredSnacks = [];

  void getFilteredSnacks() {
    setState(() {
      List<Category> activeCategories = categoryFilter.where((cf) => cf.filter).map((cf) => cf.category).toList();
      if (activeCategories.isEmpty) {
        filteredSnacks = snacks.where((snack) => snack.categories.contains(Category.recommend)).toList();
      } else {
        filteredSnacks = snacks.where((snack) => snack.categories.any((c) => activeCategories.contains(c))).toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getFilteredSnacks();
  }

  void onFavorite(Snack snack) {
    setState(() {
      snacks.firstWhere((item) => item.name == snack.name).toggleFavoriteStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg_mainscreen.png'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: double.infinity, height: 80),
              Text('Choose Your Favorite', style: Theme.of(context).textTheme.headlineSmall),
              Text('Snack', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 20),
              ChipList(onFilter: getFilteredSnacks),
              const SizedBox(height: 40),
              BurgerBlurCard(),
              const SizedBox(height: 50),
              Text('We Recommend', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 17)),
              const SizedBox(height: 15),
              if (filteredSnacks.isNotEmpty) SnackInfoCarousel(snacks: filteredSnacks, onFavorite: onFavorite),
              if (filteredSnacks.isEmpty)
                Container(
                  height: 200,
                  alignment: Alignment.center,
                  child: Text(
                    'No snacks recommended for this category.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
