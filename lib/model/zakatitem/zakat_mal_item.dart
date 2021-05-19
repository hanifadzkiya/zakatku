import 'package:get/get.dart';

import '../../constants.dart';
import '../global_setting_controller.dart';

class ZakatMalItem {
  ZakatMalItem() {
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

  late List<ZakatMalItemType> zakatMalItems = [];
  late NishabType nishabType;
  late double nishabPricePerGram;
  late double goldPrice;
  late double silverPrice;

}


class ZakatMalItemType {
  ZakatMalItemType({required this.type, required this.unit, this.kadar = 0});

  final String type;
  double unit;
  double kadar;
}
