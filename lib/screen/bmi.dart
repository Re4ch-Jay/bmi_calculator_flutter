import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screen/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/card.dart';
import '../components/card_child.dart';
import '../components/calculate_button.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';

enum Gender { male, female, empty }

class BMI extends StatefulWidget {
  const BMI({
    super.key,
  });

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  Gender selectedGender = Gender.empty;
  int height = kHeight;
  int weight = kWeight;
  int age = kAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        selectedGender = Gender.empty;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const CardChild(
                      text: "Male",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        selectedGender = Gender.empty;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const CardChild(
                      text: "Female",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "HEIGHT",
                          style: kLabelTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            const Text(
                              "cm",
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Slider(
                          max: 272,
                          min: 54,
                          value: height.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              height = value.toInt();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: BMICard(
                  color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "WEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            icon: Icons.add,
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                  child: BMICard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: Icons.add,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            onTap: () {
              CalculatorBrain calculatorBrain = CalculatorBrain(
                height: height,
                weight: weight,
                age: age,
                gender: selectedGender,
              );

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      bmiResult: calculatorBrain.calculateBMI(),
                      interpretation: calculatorBrain.getInterpretation(),
                      resultText: calculatorBrain.getResult(),
                      age: calculatorBrain.getAge(),
                      gender: calculatorBrain.getGender(selectedGender),
                    ),
                  ));
            },
            child: const Text(
              "CALCULATE",
              style: kBottomTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
