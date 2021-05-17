import 'dart:developer';

import 'package:get/get.dart';
import 'package:zakatku/constants.dart';
import 'package:zakatku/model/calculator/zakat_calculator.dart';
import 'package:zakatku/model/global_setting_controller.dart';

import '../../utils.dart';

class ZakatPenghasilanCalculator extends ZakatCalculator {
  ZakatPenghasilanCalculator() : super("Rp") {
    this.nettValue = 0;
    GlobalSettingController controller = Get.find();
    this.nishabType = nishabTypeOptions[controller.nishabTypeIdx];
    if (this.nishabType.type == "Emas") {
      this.nishabPricePerGram = controller.goldPrice;
    } else {
      this.nishabPricePerGram = controller.silverPrice;
    }
  }

  late int nettValue;
  late NishabType nishabType;
  late double nishabPricePerGram;

  @override
  String calculate() {
    if (nettValue < getNishab()) {
      return "-";
    }
    return "Rp ${doubleToCurrency(0.025 * nettValue)}/bulan";
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

  double getNishab() {
    return this.nishabPricePerGram * this.nishabType.val / 12;
  }

  @override
  String printNishab() {
    return "Rp ${getNishab().toStringAsFixed(2)} per bulan";
  }

}
