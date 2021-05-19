
import 'dart:developer';

import 'package:get/get.dart';
import 'package:zakatku/model/calculator/zakat_calculator.dart';
import 'package:zakatku/model/zakatitem/zakat_mal_item.dart';
import 'package:zakatku/utils.dart';

import '../../constants.dart';
import '../global_setting_controller.dart';

class ZakatMalCalculator extends ZakatCalculator {
  ZakatMalCalculator(ZakatMalItem item) : super(item);

  @override
  String calculate() {
    double total = 0;
    for (final item in item.zakatMalItems) {
      switch (item.type) {
        case("Emas"):
          total += item.unit * (item.kadar / 24) * item.goldPrice;
          break;
        case("Perak"):
          total += item.unit * (item.kadar / 100) * item.silverPrice;
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
    return "Rp ${doubleToCurrency(resultDouble * total)} atau ${(resultDouble / item.nishabPricePerGram).toStringAsFixed(2)} gram ${item.nishabType.type}";

  }

  @override
  ZakatCalculator changeValue(String value, String field) {
    // add item
    if (field == "add") {
      ZakatMalItemType itemType;
      switch(value) {
        case("Emas"):
          itemType = ZakatMalItemType(type: "Emas", unit: 0, kadar: 24);
          break;
        case("Perak"):
          itemType = ZakatMalItemType(type: "Perak", unit: 0, kadar: 100);
          break;
        case("Uang"):
          itemType = ZakatMalItemType(type: "Uang", unit: 0);
          break;
        default:
          itemType = ZakatMalItemType(type: "Uang", unit: 0);
      }
      this.item.zakatMalItems.add(itemType);
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
    ZakatMalItemType itemType = this.item.zakatMalItems[idx];
    switch (fieldChanged) {
      case ("unit") :
        itemType.unit = double.parse(value);
        break;
      case ("kadar") :
        itemType.kadar = double.parse(value);
        break;
      case ("remove"):
        this.item.zakatMalItems.removeAt(idx);
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

