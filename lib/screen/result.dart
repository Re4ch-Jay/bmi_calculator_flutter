import 'package:bmi_calculator/components/calculate_button.dart';
import 'package:bmi_calculator/components/card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String bmiResult, resultText, interpretation, gender, age;
  const ResultScreen({
    super.key,
    required this.bmiResult,
    required this.interpretation,
    required this.resultText,
    required this.age,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Your Result",
              style: kNumberTextStyle,
            ),
          ),
          Expanded(
            child: BMICard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    gender,
                    style: kLabelTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Age: $age",
                    style: kLabelTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 100),
                    child: Text(
                      bmiResult,
                      style: kLargeNumberTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      interpretation,
                      style: kLabelTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          CalculateButton(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                "RE-CALCULATE",
                style: kBottomTextStyle,
              ))
        ],
      ),
    );
  }
}
