import 'dart:developer';

import '../../utils.dart';
import 'zakat_calculator.dart';

class ZakatRikazCalculator extends ZakatCalculator {
  ZakatRikazCalculator() : this.nettValue = 0, super("Rp");

  int nettValue;

  @override
  String calculate() {
    return "Rp ${doubleToCurrency(nettValue * 0.2)}";
  }

  @override
  ZakatCalculator changeValue(String value, String field) {
    if (!isInteger(value)) {
      return this;
    }
    switch (field) {
      case ("nettValue") :
        this.nettValue = int.parse(value);
        break;
    }
    return this;
  }

  @override
  String printNishab() {
    return "-";
  }

}
