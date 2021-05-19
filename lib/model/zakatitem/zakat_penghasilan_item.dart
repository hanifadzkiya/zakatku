import 'package:get/get.dart';

import '../../constants.dart';
import '../global_setting_controller.dart';

class ZakatPenghasilanItem {
  ZakatPenghasilanItem() {
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
}