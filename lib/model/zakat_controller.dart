import 'package:get/get.dart';
import 'package:zakatku/model/FormContoller.dart';
import 'package:zakatku/model/calculator/zakat_calculator.dart';
import 'package:zakatku/widgets/hitung_zakat/hitung_zakat.dart';

import 'calculator/zakat_fitrah_calculator.dart';

class ZakatController extends GetxController implements FormController {

  ZakatController(ZakatCalculator zakatCalculator) {
    this.calculator = zakatCalculator.obs;
    this.calculator2 = zakatCalculator;
  }

  late Rx<ZakatCalculator> calculator;
  late ZakatCalculator calculator2;

  void changeValue(String value, String field) {
    calculator.update((calculator) {
      calculator = calculator?.changeValue(value, field);
    });
    calculator2 = calculator.value;
    update();
  }

  void calculate() {
    calculator.update((calculator) {
      calculator?.result = calculator.calculate();
    });
    calculator2 = calculator.value;
    update();
  }
}