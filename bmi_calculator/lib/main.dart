import 'package:flutter/material.dart';
import 'package:bmi_calculator/pages/input_page.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: darkBlue,
          scaffoldBackgroundColor: darkBlue,
          appBarTheme: const AppBarTheme(color: darkBlue),
          sliderTheme: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: lightGray,
            thumbColor: highlightColor,
            overlayColor: highlightColorOpaque,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
          )),
      home: const InputPage(),
      // routes: {'/results': (context) => const ResultsPage()},
    );
  }
}
