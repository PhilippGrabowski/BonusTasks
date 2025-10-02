import 'package:bonus_tasks/jp_project/data/mock_data.dart';
import 'package:bonus_tasks/jp_project/models/snack.dart';
import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/likes.dart';
import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/price.dart';
import 'package:flutter/material.dart';

const List<String> ingredients = ['Gluten', 'Sugar', 'LowFat', 'Kcal'];

class SnackDetailsCard extends StatefulWidget {
  const SnackDetailsCard({super.key, required this.snack, required this.index, required this.onFavorite});

  final Snack snack;
  final int index;
  final void Function(Snack) onFavorite;

  @override
  State<SnackDetailsCard> createState() => _SnackDetailsCardState();
}

class _SnackDetailsCardState extends State<SnackDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Likes(snack: widget.snack, onLike: () => setState(() => widget.onFavorite(widget.snack))),
        ),
        const SizedBox(height: 10),
        Text(widget.snack.name, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 22)),
        const SizedBox(height: 10),
        Text(lorem, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 20),
        Price(price: widget.snack.priceList[widget.index], imageSize: 17, fontSize: 17),
        const SizedBox(height: 20),
        Container(width: double.infinity, height: 1, color: Color.fromARGB(255, 235, 235, 245).withValues(alpha: 0.6)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ingredients', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 11)),
                Row(
                  spacing: 8,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...List.generate(
                      ingredients.length,
                      (index) => Image.asset(
                        'assets/images/icons/${ingredients[index]}.png',
                        width: 18,
                        height: 18,
                        fit: BoxFit.contain,
                        color: Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Reviews', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 11)),
                Row(
                  spacing: 2,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...List.generate(
                      widget.snack.reviews,
                      (_) => Image.asset(
                        'assets/images/icons/StarFilled.png',
                        width: 12,
                        height: 12,
                        fit: BoxFit.contain,
                        color: Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
                    ...List.generate(
                      5 - widget.snack.reviews,
                      (_) => Image.asset(
                        'assets/images/icons/Star.png',
                        width: 12,
                        height: 12,
                        fit: BoxFit.contain,
                        color: Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${widget.snack.reviews}.0',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 11, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
