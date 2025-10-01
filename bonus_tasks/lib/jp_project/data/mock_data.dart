import 'package:bonus_tasks/jp_project/models/category_filter.dart';
import 'package:bonus_tasks/jp_project/models/snack.dart';

enum Category { salty, sweet, sour, spicy, fruity, nutty, recommend }

List<Snack> snacks = [
  Snack(
    name: 'Mogli\'s Cup',
    detail: 'Strawberry ice cream',
    imagePath: 'assets/images/cupkake_cat.png',
    categories: [Category.sweet, Category.fruity, Category.recommend],
    priceList: [4.99, 6.99, 8.99],
    likes: 200,
    reviews: 4,
  ),
  Snack(
    name: 'Balu\'s Cup',
    detail: 'Pistachio ice cream',
    imagePath: 'assets/images/icecream.png',
    categories: [Category.nutty, Category.recommend],
    priceList: [4.99, 6.99, 8.99],
    likes: 100,
    reviews: 5,
  ),
  Snack(
    name: 'Magnum',
    detail: 'Chocolate and Vanilla',
    imagePath: 'assets/images/icecream_stick.png',
    categories: [Category.sweet, Category.recommend],
    priceList: [2.99, 3.99, 4.99],
    likes: 160,
    reviews: 3,
  ),
  Snack(
    name: 'Waffle Ice',
    detail: 'Chocolate and Vanilla',
    imagePath: 'assets/images/icecream_cone.png',
    categories: [Category.sweet, Category.recommend],
    priceList: [2.5, 5, 7.5],
    likes: 240,
    reviews: 3,
  ),
  Snack(
    name: 'Cheesy Prezel',
    detail: 'Breakfast snack',
    imagePath: 'assets/images/brezel.png',
    categories: [Category.salty],
    priceList: [3.5, 5, 6.5],
    likes: 150,
    reviews: 4,
  ),
  Snack(
    name: 'Mexican Tacos',
    detail: 'Basket of spicy Tacos',
    imagePath: 'assets/images/taco.png',
    categories: [Category.spicy],
    priceList: [5.5, 7.5, 9.0],
    likes: 450,
    reviews: 5,
  ),
];

List<CategoryFilter> categoryFilter = [
  CategoryFilter(Category.salty),
  CategoryFilter(Category.sweet),
  CategoryFilter(Category.sour),
  CategoryFilter(Category.spicy),
  CategoryFilter(Category.fruity),
  CategoryFilter(Category.nutty),
];

String lorem =
    'Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.';
