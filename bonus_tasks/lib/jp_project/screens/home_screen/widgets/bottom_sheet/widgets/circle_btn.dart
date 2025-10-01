import 'dart:ui';

import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({super.key, required this.imagePath, required this.action});

  final String imagePath;
  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: GestureDetector(
          onTap: action,
          child: Container(
            alignment: Alignment.center,
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.2)),
            ),
            child: Image.asset(imagePath, width: 12, color: Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.5)),
          ),
        ),
      ),
    );
  }
}
