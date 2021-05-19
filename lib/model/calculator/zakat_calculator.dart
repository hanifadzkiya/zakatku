import 'dart:developer';

import 'package:zakatku/model/calculator/zakat_fitrah_calculator.dart';
import 'package:zakatku/model/calculator/zakat_hewan_ternak_calculator.dart';
import 'package:zakatku/model/calculator/zakat_mal_calculator.dart';
import 'package:zakatku/model/calculator/zakat_penghasilan_calculator.dart';
import 'package:zakatku/model/calculator/zakat_perdagangan_calculator.dart';
import 'package:zakatku/model/calculator/zakat_pertanian_calculator.dart';
import 'package:zakatku/model/calculator/zakat_rikaz_calculator.dart';
import 'package:zakatku/model/zakatitem/zakat_fitrah_item.dart';
import 'package:zakatku/model/zakatitem/zakat_hewan_ternak_item.dart';
import 'package:zakatku/model/zakatitem/zakat_mal_item.dart';
import 'package:zakatku/model/zakatitem/zakat_penghasilan_item.dart';
import 'package:zakatku/model/zakatitem/zakat_perdagangan_item.dart';
import 'package:zakatku/model/zakatitem/zakat_pertanian_item.dart';
import 'package:zakatku/model/zakatitem/zakat_rikaz_item.dart';

import '../../constants.dart';

abstract class ZakatCalculator {
  ZakatCalculator(this.item, { this.result = "" });

  String result;
  dynamic item;

  String calculate();
  ZakatCalculator changeValue(String value, String field);
  String printNishab();

  static ZakatCalculator getInstance(ZakatId id) {
    ZakatCalculator result;
    switch (id) {
      case (ZakatId.fitrah):
        result = ZakatFitrahCalculator(ZakatFitrahItem());
        break;
      case (ZakatId.rikaz):
        result = ZakatRikazCalculator(ZakatRikazItem());
        break;
      case (ZakatId.penghasilan):
        result = ZakatPenghasilanCalculator(ZakatPenghasilanItem());
        break;
      case (ZakatId.perdagangan):
        result = ZakatPerdaganganCaclulator(ZakatPerdaganganItem());
        break;
      case (ZakatId.mal):
        result = ZakatMalCalculator(ZakatMalItem());
        break;
      case (ZakatId.pertanian):
        result = ZakatPertanianCalculator(ZakatPertanianItem());
        break;
      case (ZakatId.hewanTernak):
        result = ZakatHewanTernakCalculator(ZakatHewanTernakItem());
        break;
      default:
        result = ZakatFitrahCalculator(ZakatFitrahItem());
    }
    return result;
  }
}
