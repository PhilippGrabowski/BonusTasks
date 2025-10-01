import 'package:flutter/material.dart';

class CustomSegmentButton extends StatefulWidget {
  const CustomSegmentButton({super.key, required this.index, required this.onSegmentBtn});

  final int index;
  final void Function(int index) onSegmentBtn;

  @override
  State<CustomSegmentButton> createState() => _CustomSegmentButtonState();
}

class _CustomSegmentButtonState extends State<CustomSegmentButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 30,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(color: Color.fromARGB(255, 66, 70, 68), borderRadius: BorderRadius.circular(9)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < 3; i++) ...[
            GestureDetector(
              onTap: () => widget.onSegmentBtn(i),
              child: Container(
                width: i == 1 ? 63 : 51,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: widget.index == i ? Color.fromARGB(255, 99, 99, 102) : Color.fromARGB(255, 66, 70, 68),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  i == 0
                      ? 'Small'
                      : i == 1
                      ? 'Medium'
                      : 'Large',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 235, 235, 245).withValues(alpha: widget.index == i ? 1 : 0.6),
                  ),
                ),
              ),
            ),
            if (i == 0 && widget.index == 2 || i == 1 && widget.index == 0)
              Container(width: 1, height: 12, color: Color.fromARGB(255, 235, 235, 245).withValues(alpha: 0.6)),
          ],
        ],
      ),
    );
  }
}
