import 'package:bonus_tasks/jp_project/models/snack.dart';
import 'package:flutter/material.dart';

class Likes extends StatelessWidget {
  const Likes({super.key, required this.snack, this.onLike});

  final Snack snack;
  final void Function()? onLike;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLike,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          snack.isFavorite
              ? Image.asset(
                  'assets/images/icons/HeartFilled.png',
                  width: 14,
                  color: Color.fromARGB(255, 235, 235, 245).withValues(alpha: 0.6),
                )
              : Image.asset(
                  'assets/images/icons/Heart.png',
                  width: 14,
                  color: Color.fromARGB(255, 235, 235, 245).withValues(alpha: 0.6),
                ),
          Text(
            '${snack.likes}',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, color: Color.fromARGB(255, 217, 217, 217)),
          ),
        ],
      ),
    );
  }
}
