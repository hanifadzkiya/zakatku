import 'dart:developer';

import 'package:get/get.dart';
import 'package:zakatku/model/calculator/zakat_calculator.dart';
import 'package:zakatku/model/zakatitem/zakat_perdagangan_item.dart';

import '../../constants.dart';
import '../../utils.dart';
import '../global_setting_controller.dart';

class ZakatPerdaganganCaclulator extends ZakatCalculator {
  ZakatPerdaganganCaclulator(ZakatPerdaganganItem item) : super(item);

  @override
  String calculate() {
    double total =
        item.nilaiBarangDagangan + item.uang + item.piutang - item.hutang;
    if (total < getNishab()) {
      return "-";
    }
    return "Rp ${doubleToCurrency(0.025 * total)}";
  }

  @override
  ZakatCalculator changeValue(String value, String field) {
    if (!isNumeric(value)) {
      return this;
    }
    log("UPdate $value ${field}");
    switch (field) {
      case ("nilaiBarangDagangan"):
        this.item.nilaiBarangDagangan = double.parse(value);
        break;
      case ("uang"):
        this.item.uang = double.parse(value);
        break;
      case ("piutang"):
        this.item.piutang = double.parse(value);
        break;
      case ("hutang"):
        this.item.hutang = double.parse(value);
        break;
      default:
        break;
    }
    return this;
  }

  double getNishab() {
    return this.item.nishabPricePerGram * this.item.nishabType.val;
  }

  @override
  String printNishab() {
    return "Rp ${getNishab().toStringAsFixed(2)}";
  }
}
