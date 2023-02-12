import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const RoundIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      elevation: 6,
      constraints: const BoxConstraints.tightFor(height: 56, width: 56),
      child: Icon(icon),
    );
  }
}
