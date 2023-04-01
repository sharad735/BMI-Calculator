import 'dart:math';

class CalculatorBrain {
  final int? height;
  final int? weight;
  double? _bmi;

  CalculatorBrain({this.height, this.weight});

  String getResult() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResultText() {
    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! >= 18) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String getResultInterpretation() {
    if (_bmi! >= 25) {
      return ' you are overweight try dieting';
    } else if (_bmi! >= 18) {
      return 'Congrats you are normal';
    } else {
      return 'You are underweight try increase your weight';
    }
  }
}
