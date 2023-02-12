import 'dart:math';

import 'package:bmi_calculator/screen/bmi.dart';

class CalculatorBrain {
  final int height, weight, age;
  final Gender? gender;

  late double _result;

  CalculatorBrain({
    required this.height,
    required this.weight,
    required this.gender,
    required this.age,
  });

  String calculateBMI() {
    _result = weight / pow(height / 100, 2);
    return _result.toStringAsFixed(1);
  }

  String getResult() {
    if (_result >= 25) {
      return 'Overweight';
    } else if (_result > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getGender(Enum gender) {
    if (gender == Gender.male) {
      return "Male";
    } else if (gender == Gender.female) {
      return "Female";
    } else {
      return '';
    }
  }

  String getAge() {
    return age.toString();
  }

  String getInterpretation() {
    if (_result >= 25) {
      return 'You have a higher than normal weight. Try excercise more.';
    } else if (_result > 18.5) {
      return 'You are fit and healthy. Well Done!';
    } else {
      return 'You have a lower weight. Try to eat more.';
    }
  }
}
