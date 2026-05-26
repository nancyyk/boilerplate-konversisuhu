import 'package:flutter/material.dart';

class SuhuProvider extends ChangeNotifier {

  double fahrenheit = 0;
  double kelvin = 0;

  void konversi(String celciusText) {
    double c = double.tryParse(celciusText) ?? 0;

    fahrenheit = (c * 9 / 5) + 32;
    kelvin = c + 273.15;

    notifyListeners();
  }

  void reset() {
    fahrenheit = 0;
    kelvin = 0;
    notifyListeners();
  }
}