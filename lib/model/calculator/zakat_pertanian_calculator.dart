import 'package:zakatku/model/calculator/zakat_calculator.dart';

import '../../utils.dart';

class ZakatPertanianCalculator extends ZakatCalculator {
  ZakatPertanianCalculator() : this.weight = 0, this.waterSupplyIdx = 0, super("Kg");

  int waterSupplyIdx;
  double weight;
  int sha = 3;

  @override
  String calculate() {
    if (weight < getNishab()) {
      return "-";
    }
    double zakat = waterSupplyTypes[waterSupplyIdx].rate * weight;
    return "${zakat.toStringAsFixed(2)} Kg";
  }

  @override
  ZakatCalculator changeValue(String value, String field) {
    if (!isNumeric(value)) {
      return this;
    }
    switch (field) {
      case ("weight") :
        this.weight = double.parse(value);
        break;
      case ("waterSupply") :
        this.waterSupplyIdx = int.parse(value);
        break;
    }
    return this;
  }

  @override
  String printNishab() {
    return "${getNishab().toStringAsFixed(2)} Kg";
  }

  double getNishab() {
    return 300.0 * sha;
  }

}

class WaterSupplyType {
  const WaterSupplyType({required this.id, required this.description, required this.rate});

  final int id;
  final String description;
  final double rate;
}

const waterSupplyTypes = [
  WaterSupplyType(id: 1, description: "Alami (Air Hujan, Sungai)", rate: 0.1),
  WaterSupplyType(id: 1, description: "Buatan", rate: 0.05),
  WaterSupplyType(id: 1, description: "Kombinasi", rate: 0.075),
];