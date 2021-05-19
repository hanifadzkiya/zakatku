import 'package:zakatku/model/calculator/zakat_calculator.dart';
import 'package:zakatku/model/zakatitem/zakat_hewan_ternak_item.dart';

import '../../utils.dart';

class ZakatHewanTernakCalculator extends ZakatCalculator {
  ZakatHewanTernakCalculator(ZakatHewanTernakItem item)
      :
        super(item);

  @override
  String calculate() {
    switch (item.cattleTypeIdx) {
      case (0):
        return calculateCamel(item.total);
      case (1):
        return calculateCow(item.total);
      case (2):
        return calculateGoat(item.total);
      default:
        return "-";
    }
  }

  @override
  ZakatCalculator changeValue(String value, String field) {
    if (!isNumeric(value)) {
      return this;
    }
    switch (field) {
      case ("total"):
        this.item.total = int.parse(value);
        break;
      case ("cattleType"):
        this.item.cattleTypeIdx = int.parse(value);
        break;
    }
    return this;
  }

  @override
  String printNishab() {
    return "5 (Unta), 30 (Sapi), 40 (Kambing)";
  }

  String calculateCamel(int total) {
    if (total < 5) {
      return "-";
    }
    if (total >= 5 && total <= 9) {
      return "1 Kambing (syah)";
    }
    if (total >= 10 && total <= 14) {
      return "2 Kambing (syah)";
    }
    if (total >= 15 && total <= 19) {
      return "3 Kambing (syah)";
    }
    if (total >= 20 && total <= 24) {
      return "4 Kambing (syah)";
    }
    if (total >= 25 && total <= 35) {
      return "1 bintu makhod (unta betina berumur 1 tahun)";
    }
    if (total >= 36 && total <= 45) {
      return "1 bintu labun (unta betina berumur 2 tahun)";
    }
    if (total >= 46 && total <= 60) {
      return "1 hiqqoh (Unta betina berumur 3 tahun)";
    }
    if (total >= 61 && total <= 75) {
      return "1 jadza'ah (unta bertina berumur 3 tahun)";
    }
    if (total >= 76 && total <= 90) {
      return "2 bintu labun (unta betina berumur 2 tahun)";
    }
    if (total >= 91 && total <= 120) {
      return "2 hiqqoh (unta betina berumur 3 tahun)";
    }
    final int hiqqoh = total ~/ 50;
    final int bintuLabun = (total % 50 + 40) ~/ 40;
    return "${hiqqoh} hiqqah  (unta betina berumur 3 tahun) dan ${bintuLabun}  bintu labun (unta betina berumur 2 tahun)";
  }

  String calculateCow(int total) {
    if (total < 30) {
      return "-";
    }
    if (total >= 30 && total <= 39) {
      return "1 tabi' (sapi jantan berumur 1 tahun) atau tabi'ah (sapi bertina berumur 1 tahun)";
    }
    if (total >= 40 && total <= 59) {
      return "1 musinnah (sapi betina berumur 2 tahun)";
    }
    if (total >= 60 && total <= 69) {
      return "2 tabi' (sapi jantan berumur 1 tahun)";
    }
    if (total >= 70 && total <= 79) {
      return "1 musinnah (sapi betina berumur 2 tahun) dan 1 tabi' (sapi jantan berumur 1 tahun)";
    }
    if (total >= 80 && total <= 89) {
      return "2 musinnah (sapi betina berumur 2 tahun)";
    }
    if (total >= 90 && total <= 99) {
      return "3 tabi' (sapi jantan berumur 1 tahun)";
    }
    if (total >= 100 && total <= 109) {
      return "1 musinnah (sapi betina berumur 2 tahun) dan 2 tabi' (sapi jantan berumur 1 tahun)";
    }
    if (total >= 110 && total <= 119) {
      return "2 musinnah (sapi betina berumur 2 tahun) dan 1 tabi' (sapi jantan berumur 1 tahun)";
    }
    final int musinnah = total ~/ 40;
    final int tabi = (total % 40 + 30 - 1) ~/ 30;
    return "${musinnah} musinnah (sapi betina berumur 2 tahun) dan ${tabi} tabi' (sapi jantan berumur 1 tahun)";
  }

  String calculateGoat(int total) {
    if (total < 40) {
      return "-";
    }
    if (total >= 40 && total <= 120) {
      return "1 kambing dari jenis domba yang berumur 1 tahun atau 1 kambing dari jenis ma’iz yang berumur 2 tahun";
    }
    if (total >= 121 && total <= 200) {
      return "2 kambing";
    }
    return "${(total + 99) ~/ 100} kambing";
  }
}

