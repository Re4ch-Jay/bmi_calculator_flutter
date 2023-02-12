import 'package:flutter/material.dart';
import '../constants.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          color: kHexBottomContainerColor,
          height: 80,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
