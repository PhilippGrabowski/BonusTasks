import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  const Price({
    super.key,
    required this.price,
    required this.imageSize,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 16,
  });

  final double price;
  final double imageSize;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        Image.asset('assets/images/icons/cost.png', width: imageSize, height: imageSize, fit: BoxFit.cover),
        Text(
          price.toStringAsFixed(2),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: fontWeight, fontSize: fontSize),
        ),
      ],
    );
  }
}
