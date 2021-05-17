import 'dart:developer';

import 'package:zakatku/model/calculator/zakat_fitrah_calculator.dart';
import 'package:zakatku/model/calculator/zakat_hewan_ternak_calculator.dart';
import 'package:zakatku/model/calculator/zakat_mal_calculator.dart';
import 'package:zakatku/model/calculator/zakat_penghasilan_calculator.dart';
import 'package:zakatku/model/calculator/zakat_perdagangan_calculator.dart';
import 'package:zakatku/model/calculator/zakat_pertanian_calculator.dart';
import 'package:zakatku/model/calculator/zakat_rikaz_calculator.dart';

import '../../constants.dart';

abstract class ZakatCalculator {
  ZakatCalculator(this.unit, { this.result = "" });

  String result;
  String unit;

  String calculate();
  ZakatCalculator changeValue(String value, String field);
  String printNishab();

  static ZakatCalculator getInstance(ZakatId id) {
    ZakatCalculator result;
    switch (id) {
      case (ZakatId.fitrah):
        result = ZakatFitrahCalculator();
        break;
      case (ZakatId.rikaz):
        result = ZakatRikazCalculator();
        break;
      case (ZakatId.penghasilan):
        result = ZakatPenghasilanCalculator();
        break;
      case (ZakatId.perdagangan):
        result = ZakatPerdaganganCaclulator();
        break;
      case (ZakatId.mal):
        result = ZakatMalCalculator();
        break;
      case (ZakatId.pertanian):
        result = ZakatPertanianCalculator();
        break;
      case (ZakatId.hewanTernak):
        result = ZakatHewanTernakCalculator();
        break;
      default:
        result = ZakatFitrahCalculator();
    }
    return result;
  }
}
