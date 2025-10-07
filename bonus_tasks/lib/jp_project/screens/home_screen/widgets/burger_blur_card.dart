import 'package:bonus_tasks/jp_project/screens/home_screen/widgets/snack_info_blur_card.dart';
import 'package:bonus_tasks/jp_project/widgets/blur_container.dart';
import 'package:flutter/material.dart';

class BurgerBlurCard extends StatelessWidget {
  const BurgerBlurCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CustomPaint(
            painter: CardShapePainter(borderColor: Colors.white.withValues(alpha: 0.2)),
            child: ClipPath(
              clipper: CardShapeClipper(),
              child: BlurContainer(
                content: Center(),
                blur: 20,
                width: double.infinity,
                height: 260,
                padding: EdgeInsets.all(20),
                withoutBorder: true,
                color: Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.2),
                borderColorAlpha: 0.4,
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withValues(alpha: 0.4),
                    Colors.black.withValues(alpha: 0.1),
                    Colors.white.withValues(alpha: 0.1),
                  ],
                  stops: [0, 0.8, 1],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: SnackInfoBlurCard(context: context),
        ),
        Positioned(
          bottom: -20,
          right: 20,
          child: Image.asset('assets/images/burger.png', width: 230, fit: BoxFit.contain),
        ),
      ],
    );
  }
}

class CardShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double width = size.width;
    final double height = size.height;
    final double radius = 30;

    path.moveTo(radius, 0); // default 0,0
    path.lineTo(width - radius, 0);
    path.arcToPoint(Offset(width, radius), radius: Radius.circular(radius), clockwise: true); // im Uhrzeigersinn
    path.lineTo(width, height * 0.8 - radius);
    path.arcToPoint(Offset(width - radius, height * 0.8), radius: Radius.circular(radius), clockwise: true);
    path.lineTo(radius, height);
    path.arcToPoint(Offset(0, height - radius), radius: Radius.circular(radius), clockwise: true);
    path.lineTo(0, radius);
    path.arcToPoint(Offset(radius, 0), radius: Radius.circular(radius), clockwise: true);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false; // Pfad muss nicht neu gezeichnet werden
}

class CardShapePainter extends CustomPainter {
  final Color borderColor;
  final double borderWidth;

  CardShapePainter({this.borderColor = Colors.white, this.borderWidth = 3});

  @override
  void paint(Canvas canvas, Size size) {
    final path = CardShapeClipper().getClip(size);
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
