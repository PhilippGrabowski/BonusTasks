import 'dart:ui';

import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  const BlurContainer({
    super.key,
    required this.content,
    required this.blur,
    required this.width,
    required this.height,
    required this.padding,
    required this.color,
    required this.borderColorAlpha,
    this.gradient,
    this.selected = false,
    this.withoutBorder = false,
  });

  final Widget content;
  final double blur;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final Color color;
  final double borderColorAlpha;
  final Gradient? gradient;
  final bool selected;
  final bool withoutBorder;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: blur, sigmaX: blur),
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          padding: padding,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(withoutBorder ? 0 : 30),
            border: withoutBorder ? null : Border.all(color: Colors.white.withValues(alpha: borderColorAlpha)),
            gradient: gradient,
          ),
          child: content,
        ),
      ),
    );
  }
}
