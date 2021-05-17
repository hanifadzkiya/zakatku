
import 'dart:developer';

import 'package:get/get.dart';
import 'package:zakatku/model/calculator/zakat_calculator.dart';
import 'package:zakatku/utils.dart';

import '../../constants.dart';
import '../global_setting_controller.dart';

class ZakatMalCalculator extends ZakatCalculator {
  ZakatMalCalculator() : super("Rp") {
    GlobalSettingController controller = Get.find();
    this.nishabType = nishabTypeOptions[controller.nishabTypeIdx];
    this.goldPrice = controller.goldPrice;
    this.silverPrice = controller.silverPrice;
    if (this.nishabType.type == "Emas") {
      this.nishabPricePerGram = this.goldPrice;
    } else {
      this.nishabPricePerGram = this.silverPrice;
    }
  }

  late List<ZakatMalItem> zakatMalItems = [];
  late NishabType nishabType;
  late double nishabPricePerGram;
  late double goldPrice;
  late double silverPrice;

  @override
  String calculate() {
    double total = 0;
    for (final item in zakatMalItems) {
      switch (item.type) {
        case("Emas"):
          total += item.unit * (item.kadar / 24) * goldPrice;
          break;
        case("Perak"):
          total += item.unit * (item.kadar / 100) * silverPrice;
          break;
        case("Uang"):
          total += item.unit;
          break;
        default:
          break;
      }
    }
    if (total < getNishab()) {
      return "-";
    }
    double resultDouble = 0.025 * total;
    return "Rp ${doubleToCurrency(resultDouble * total)} atau ${(resultDouble / nishabPricePerGram).toStringAsFixed(2)} gram ${nishabType.type}";

  }

  @override
  ZakatCalculator changeValue(String value, String field) {
    // add item
    if (field == "add") {
      ZakatMalItem item;
      switch(value) {
        case("Emas"):
          item = ZakatMalItem(type: "Emas", unit: 0, kadar: 24);
          break;
        case("Perak"):
          item = ZakatMalItem(type: "Perak", unit: 0, kadar: 100);
          break;
        case("Uang"):
          item = ZakatMalItem(type: "Uang", unit: 0);
          break;
        default:
          item = ZakatMalItem(type: "Uang", unit: 0);
      }
      log("Add items");
      zakatMalItems.add(item);
      return this;
    }

    // field format = idx-field
    // ex : 0-unit
    List<String> fieldList = field.split("-");
    int idx = int.parse(fieldList.first);
    String fieldChanged = fieldList.last;
    if (!isNumeric(value)) {
      return this;
    }
    ZakatMalItem item = zakatMalItems[idx];
    switch (fieldChanged) {
      case ("unit") :
        item.unit = double.parse(value);
        break;
      case ("kadar") :
        item.kadar = double.parse(value);
        break;
      case ("remove"):
        zakatMalItems.removeAt(idx);
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

class ZakatMalItem {
  ZakatMalItem({required this.type, required this.unit, this.kadar = 0});

  final String type;
  double unit;
  double kadar;
}
