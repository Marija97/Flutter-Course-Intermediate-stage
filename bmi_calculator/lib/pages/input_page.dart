import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/custom_widgets.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/bottom_bar.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? genderSelected;
  int height = 180;
  int weight = 74;
  int age = 19;

  void switchToMale() {
    setState(() => genderSelected = Gender.male);
  }

  void switchToFemale() {
    setState(() => genderSelected = Gender.female);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  color: genderSelected == Gender.male
                      ? activeColor
                      : inactiveColor,
                  cardChild: const IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                  onPress: switchToMale,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: genderSelected == Gender.female
                      ? activeColor
                      : inactiveColor,
                  cardChild: const IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                  onPress: switchToFemale,
                ),
              ),
            ]),
          ),
          Expanded(
            child: ReusableCard(
              color: shadowBlue,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: labelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: numberTextStyle),
                      const Text('cm', style: labelTextStyle)
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: minHeight,
                    max: maxHeight,
                    onChanged: (double selectedHeight) {
                      setState(() => height = selectedHeight.toInt());
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  color: shadowBlue,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('WEIGHT', style: labelTextStyle),
                      Text(weight.toString(), style: numberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () => setState(() => weight--),
                          ),
                          const SizedBox(width: 10.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () => setState(() => weight++),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: shadowBlue,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('AGE', style: labelTextStyle),
                      Text(age.toString(), style: numberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () => setState(() => age--),
                          ),
                          const SizedBox(width: 10.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () => setState(() => age++),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
          BottomBar(
            label: 'CALCULATE',
            onPress: () {
              final calcBrain = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            calculator: calcBrain,
                          )));
            },
          ),
        ],
      ),
    );
  }
}
