import 'package:get/get.dart';

import '../../constants.dart';
import '../global_setting_controller.dart';

class ZakatPerdaganganItem {
  ZakatPerdaganganItem() {
    this.nilaiBarangDagangan = 0;
    this.uang = 0;
    this.piutang = 0;
    this.hutang = 0;
    GlobalSettingController controller = Get.find();
    this.nishabType = nishabTypeOptions[controller.nishabTypeIdx];
    if (this.nishabType.type == "Emas") {
      this.nishabPricePerGram = controller.goldPrice;
    } else {
      this.nishabPricePerGram = controller.silverPrice;
    }
  }

  late double nilaiBarangDagangan;
  late double uang;
  late double piutang;
  late double hutang;
  late NishabType nishabType;
  late double nishabPricePerGram;

}