import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/bottom_sheet/widgets/circle_btn.dart';
import 'package:flutter/material.dart';

class CounterRow extends StatefulWidget {
  const CounterRow({super.key, required this.amount, required this.onCircleBtn});

  final int amount;
  final void Function(bool operation) onCircleBtn;

  @override
  State<CounterRow> createState() => _CounterRowState();
}

class _CounterRowState extends State<CounterRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 15,
      children: [
        CircleButton(imagePath: 'assets/images/icons/Minus.png', action: () => widget.onCircleBtn(false)),
        Text(widget.amount.toString(), style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 17)),
        CircleButton(imagePath: 'assets/images/icons/Plus.png', action: () => widget.onCircleBtn(true)),
      ],
    );
  }
}
