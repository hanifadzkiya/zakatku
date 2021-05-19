import 'dart:developer';

import 'package:zakatku/model/zakatitem/zakat_rikaz_item.dart';

import '../../utils.dart';
import 'zakat_calculator.dart';

class ZakatRikazCalculator extends ZakatCalculator {
  ZakatRikazCalculator(ZakatRikazItem item) : super(item);

  @override
  String calculate() {
    return "Rp ${doubleToCurrency(item.nettValue * 0.2)}";
  }

  @override
  ZakatCalculator changeValue(String value, String field) {
    if (!isInteger(value)) {
      return this;
    }
    switch (field) {
      case ("nettValue") :
        this.item.nettValue = int.parse(value);
        break;
    }
    return this;
  }

  @override
  String printNishab() {
    return "-";
  }

}
