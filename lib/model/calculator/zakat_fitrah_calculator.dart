import 'dart:developer';

import 'package:zakatku/model/zakatitem/zakat_fitrah_item.dart';

import '../../utils.dart';
import 'zakat_calculator.dart';

class ZakatFitrahCalculator extends ZakatCalculator {
  ZakatFitrahCalculator(item) : super(item);

  @override
  String calculate() {
    if (item.people == 0) {
      return "-";
    }
    return "${(item.people * 3).toStringAsFixed(2)} Kg";
  }

  @override
  ZakatCalculator changeValue(String value, String field) {
    if (!isInteger(value)) {
      return this;
    }
    switch (field) {
      case ("jumlahJiwa") :
        this.item.people  = int.parse(value);
        break;
    }
    return this;
  }

  @override
  String printNishab() {
    return "-";
  }

}
