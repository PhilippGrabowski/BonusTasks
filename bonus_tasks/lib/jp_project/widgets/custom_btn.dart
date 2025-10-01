import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.color1,
    required this.color2,
    required this.width,
    required this.height,
    this.action,
  });

  final Widget label;
  final Color color1;
  final Color color2;
  final double width;
  final double height;
  final void Function()? action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [Colors.black.withValues(alpha: 0.5), Colors.white.withValues(alpha: 0.5)]),
        ),
        child: Container(
          width: width - 1,
          height: height - 1,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [color1, color2]),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -1),
                color: Color.fromARGB(255, 147, 117, 182),
                blurRadius: 8,
                blurStyle: BlurStyle.inner,
              ),
              BoxShadow(
                offset: Offset(0, 0),
                color: Color.fromARGB(255, 255, 172, 227),
                blurRadius: 5,
                blurStyle: BlurStyle.inner,
              ),
              BoxShadow(
                offset: Offset(0, 10),
                color: Color.fromARGB(255, 234, 113, 198).withValues(alpha: 0.5),
                blurRadius: 30,
              ),
            ],
          ),
          child: label,
        ),
      ),
    );
  }
}
