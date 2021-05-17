import 'package:get/get.dart';

import 'calculator/zakat_calculator.dart';

abstract class FormController extends GetxController {
  void changeValue(String value, String field);
}