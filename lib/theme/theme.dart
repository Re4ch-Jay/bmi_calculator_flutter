import 'package:flutter/material.dart';
import '../constants.dart';

ThemeData ThemeStyle() {
  return ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: kPrimaryColor,
    ),
    scaffoldBackgroundColor: kPrimaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF4C4F5E),
    ),
    sliderTheme: const SliderThemeData().copyWith(
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
      activeTrackColor: Colors.white,
      inactiveTrackColor: const Color(0xFFB3B3B3),
      thumbColor: kHexBottomContainerColor,
      overlayColor: const Color(0x29E961AA),
    ),
  );
}
