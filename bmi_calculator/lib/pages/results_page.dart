import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_bar.dart';
// import 'package:bmi_calculator/calculator_brain.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({required this.calculator});
  final calculator;
//  final CalculatorBrain calculator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: const Text('Your Result', style: titleTextStyle),
              padding: const EdgeInsets.only(left: 30.0),
              alignment: Alignment.bottomLeft,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: activeColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(calculator.getBMILabel(), style: resultTextStyle),
                  Text(calculator.getBMIValue(), style: bmiTextStyle),
                  Text(
                    calculator.getBMIDescription(),
                    style: descriptionTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomBar(
            label: 'RECALCULATE',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
