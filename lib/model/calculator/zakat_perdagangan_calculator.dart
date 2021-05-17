import 'dart:developer';

import 'package:get/get.dart';
import 'package:zakatku/model/calculator/zakat_calculator.dart';

import '../../constants.dart';
import '../../utils.dart';
import '../global_setting_controller.dart';

class ZakatPerdaganganCaclulator extends ZakatCalculator {
  ZakatPerdaganganCaclulator() : super("Rp") {
    this.nilaiBarangDagangan = 0;
    this.uang = 0;
    this.piutang = 0;
    this.hutang = 0;
    GlobalSettingController controller = Get.find();
    this.nishabType = nishabTypeOptions[controller.nishabTypeIdx];
    if (this.nishabType.type == "Emas") {
      this.nishabPricePerGram = controller.goldPrice;
    } else {
      this.nishabPricePerGram = controller.silverPrice;
    }
  }

  late double nilaiBarangDagangan;
  late double uang;
  late double piutang;
  late double hutang;
  late NishabType nishabType;
  late double nishabPricePerGram;

  @override
  String calculate() {
    double total = nilaiBarangDagangan + uang + piutang - hutang;
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
      case ("nilaiBarangDagangan") :
        this.nilaiBarangDagangan = double.parse(value);
        break;
      case ("uang") :
        this.uang = double.parse(value);
        break;
      case ("piutang") :
        this.piutang = double.parse(value);
        break;
      case ("hutang") :
        this.hutang = double.parse(value);
        break;
      default:
        break;
    }
    return this;
  }

  double getNishab() {
    return this.nishabPricePerGram * this.nishabType.val;
  }

  @override
  String printNishab() {
    return "Rp ${getNishab().toStringAsFixed(2)}";
  }

}
