import 'package:zakatku/model/calculator/zakat_calculator.dart';
import 'package:zakatku/model/zakatitem/zakat_pertanian_item.dart';

import '../../utils.dart';

class ZakatPertanianCalculator extends ZakatCalculator {
  ZakatPertanianCalculator(ZakatPertanianItem item) : super(item);

  @override
  String calculate() {
    if (item.weight < getNishab()) {
      return "-";
    }
    double zakat = waterSupplyTypes[item.waterSupplyIdx].rate * item.weight;
    return "${zakat.toStringAsFixed(2)} Kg";
  }

  @override
  ZakatCalculator changeValue(String value, String field) {
    if (!isNumeric(value)) {
      return this;
    }
    switch (field) {
      case ("weight") :
        this.item.weight = double.parse(value);
        break;
      case ("waterSupply") :
        this.item.waterSupplyIdx = int.parse(value);
        break;
    }
    return this;
  }

  @override
  String printNishab() {
    return "${getNishab().toStringAsFixed(2)} Kg";
  }

  double getNishab() {
    return 300.0 * item.sha;
  }

}
