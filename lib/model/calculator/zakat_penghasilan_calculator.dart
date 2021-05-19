import 'dart:developer';

import 'package:zakatku/model/calculator/zakat_calculator.dart';
import 'package:zakatku/model/zakatitem/zakat_penghasilan_item.dart';

import '../../utils.dart';

class ZakatPenghasilanCalculator extends ZakatCalculator {
  ZakatPenghasilanCalculator(ZakatPenghasilanItem item) : super(item);

  @override
  String calculate() {
    if (item.nettValue < getNishab()) {
      return "-";
    }
    return "Rp ${doubleToCurrency(0.025 * item.nettValue)}/bulan";
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

  double getNishab() {
    return this.item.nishabPricePerGram * this.item.nishabType.val / 12;
  }

  @override
  String printNishab() {
    return "Rp ${getNishab().toStringAsFixed(2)} per bulan";
  }

}
