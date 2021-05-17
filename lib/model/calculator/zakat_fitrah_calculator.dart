import 'dart:developer';

import '../../utils.dart';
import 'zakat_calculator.dart';

class ZakatFitrahCalculator extends ZakatCalculator {
  ZakatFitrahCalculator() : this.people = 0, super("Kg");

  int people;

  @override
  String calculate() {
    if (people == 0) {
      return "-";
    }
    return "${(people * 3).toStringAsFixed(2)} Kg";
  }

  @override
  ZakatCalculator changeValue(String value, String field) {
    if (!isInteger(value)) {
      return this;
    }
    switch (field) {
      case ("jumlahJiwa") :
        this.people = int.parse(value);
        break;
    }
    return this;
  }

  @override
  String printNishab() {
    return "-";
  }

}
