import 'package:bonus_tasks/jp_project/models/snack.dart';
import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/likes.dart';
import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/price.dart';
import 'package:flutter/material.dart';

class SnackInfoCard extends StatelessWidget {
  const SnackInfoCard({super.key, required this.snack, required this.onFavorite});

  final Snack snack;
  final void Function() onFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(width: 0.5, color: Colors.white.withValues(alpha: 0.5)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 198, 198, 198).withValues(alpha: 0.3),
            Color.fromARGB(255, 143, 140, 245),
            Color.fromARGB(255, 141, 91, 234).withValues(alpha: 0.8),
          ],
          stops: [0.07, 0.61, 1],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(tag: snack.name, child: Image.asset(snack.imagePath)),
            const SizedBox(height: 10),
            Text(snack.name, style: Theme.of(context).textTheme.bodyLarge),
            Text(
              snack.detail,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, color: Color.fromARGB(255, 217, 217, 217)),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Price(price: snack.priceList[2], imageSize: 13, fontWeight: FontWeight.w400, fontSize: 13),
                Likes(snack: snack),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
