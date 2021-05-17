import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:zakatku/constants.dart';

bool isInteger(String? s) => s != null && int.tryParse(s) != null;

bool isNumeric(String? s) => s != null && double.tryParse(s) != null;

enumFromString(List enumValues, String? value) {
  return enumValues.firstWhere(
      (type) => type.toString().split('.').last == value,
      orElse: () => null);
}

String doubleToCurrency(double value) {
  log(new NumberFormat("#,##0.00", "en_US").format(value));
  return new NumberFormat("#,##0.00", "en_US").format(value);
}
