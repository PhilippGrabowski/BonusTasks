import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/price.dart';
import 'package:bonus_tasks/jp_project/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class SnackInfoBlurCard extends StatelessWidget {
  const SnackInfoBlurCard({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Angi\'s Yummy Burger',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16, fontFamily: 'SFProText'),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [Color.fromARGB(255, 233, 112, 196), Color.fromARGB(255, 246, 158, 163)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: Image.asset('assets/images/icons/StarFilled.png', width: 14, height: 14),
                  ),
                  Text(
                    '4.8',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 217, 217, 217),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            'Delish vegan burger',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, color: Color.fromARGB(255, 217, 217, 217)),
          ),
          Text(
            'that tastes like heaven',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, color: Color.fromARGB(255, 217, 217, 217)),
          ),
          const SizedBox(height: 15),
          Price(price: 13.99, imageSize: 16),
          Spacer(),
          CustomButton(
            label: Text('Add to order', style: Theme.of(context).textTheme.labelMedium),
            color1: Color.fromARGB(255, 187, 141, 225),
            color2: Color.fromARGB(255, 144, 140, 245),
            width: 100,
            height: 44,
            action: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(Navigator.of(context).context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Your snack has been added.',
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
