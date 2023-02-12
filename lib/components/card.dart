import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;

  const BMICard({
    super.key,
    required this.color,
    this.cardChild,
    this.onTap,
    this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    // GestureDectector must be a parent widget if we want to apply functionality
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}
