class ZakatFitrahItem {
  ZakatFitrahItem() : this.people = 0;
  int people;
}

class CattleType {
  const CattleType({required this.id, required this.description});

  final int id;
  final String description;
}

const cattleTypes = [
  CattleType(id: 0, description: "Unta"),
  CattleType(id: 1, description: "Sapi, Kerbau"),
  CattleType(id: 2, description: "Kambing, Domba"),
];
