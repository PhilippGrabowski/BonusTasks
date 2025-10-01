import 'package:bonus_tasks/jp_project/data/mock_data.dart';
import 'package:bonus_tasks/jp_project/models/snack.dart';
import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/bottom_sheet/widgets/circle_btn.dart';
import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/bottom_sheet/widgets/counter_row.dart';
import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/bottom_sheet/widgets/custom_segment_btn.dart';
import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/bottom_sheet/widgets/snack_details_card.dart';
import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/price.dart';
import 'package:bonus_tasks/jp_project/widgets/blur_container.dart';
import 'package:bonus_tasks/jp_project/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key, required this.snack, required this.onFavorite});

  final Snack snack;
  final void Function() onFavorite;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  int amount = 1;
  int index = 2;
  double get price => amount * widget.snack.priceList[index];

  void _selectSize(int newIndex) {
    setState(() => index = newIndex);
  }

  void _deOrIncreaseAmount(bool operation) {
    if (!operation && amount > 1) {
      setState(() => amount--);
    } else if (operation) {
      setState(() => amount++);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget btnContent = Row(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Add to order for', style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 17)),
        Price(price: price, imageSize: 14, fontSize: 17, fontWeight: FontWeight.w600),
      ],
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color.fromARGB(255, 54, 66, 66), Color.fromARGB(255, 47, 43, 34)],
          stops: [0, 0.45],
        ),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CircleButton(imagePath: 'assets/images/icons/Cancel.png', action: () => Navigator.pop(context)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(width: double.infinity, height: 470),
                      Positioned(
                        top: -190,
                        child: Hero(tag: widget.snack.name, child: Image.asset(widget.snack.imagePath, width: 410)),
                      ),
                      BlurContainer(
                        content: SnackDetailsCard(snack: widget.snack, index: index, onFavorite: widget.onFavorite),
                        blur: 30,
                        width: double.infinity,
                        height: 345,
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                        color: Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.2),
                        borderColorAlpha: 0.3,
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withValues(alpha: 0.1),
                            Colors.black.withValues(alpha: 0.1),
                            Colors.white.withValues(alpha: 0.1),
                          ],
                          stops: [0, 0.8, 1],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomSegmentButton(onSegmentBtn: _selectSize, index: index),
                      CounterRow(amount: amount, onCircleBtn: _deOrIncreaseAmount),
                    ],
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    label: btnContent,
                    color1: Color.fromARGB(255, 233, 112, 197),
                    color2: Color.fromARGB(255, 246, 158, 162),
                    width: double.infinity,
                    height: 50,
                    action: () {
                      Navigator.pop(context);
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
            ),
          ),
        ],
      ),
    );
  }
}
