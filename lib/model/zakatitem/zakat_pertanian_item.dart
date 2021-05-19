class ZakatPertanianItem {
  ZakatPertanianItem() : this.weight = 0, this.waterSupplyIdx = 0;

  int waterSupplyIdx;
  double weight;
  int sha = 3;
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
