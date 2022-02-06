import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required int height, required int weight}) {
    _bmi = weight / pow(height / 100, 2);
  }

  double _bmi = 0;

  String getBMIValue() {
    return _bmi.toStringAsFixed(1);
  }

  String getBMILabel() {
    if (_bmi >= 25) {
      return 'Overweight'.toUpperCase();
    } else if (_bmi > 18.5) {
      return 'Normal'.toUpperCase();
    } // (_bmi < 18.5)
    return 'Underweight'.toUpperCase();
  }

  String getBMIDescription() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } // (_bmi < 18.5)
    return 'You have a lower than normal body weight. You can eat a bit more.';
  }
}
