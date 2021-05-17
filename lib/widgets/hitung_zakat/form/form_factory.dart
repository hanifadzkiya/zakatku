import 'package:flutter/material.dart';
import 'package:zakatku/constants.dart';
import 'package:zakatku/model/zakat_controller.dart';
import 'package:zakatku/widgets/hitung_zakat/form/zakat_fitrah_form.dart';
import 'package:zakatku/widgets/hitung_zakat/form/zakat_hewan_ternak_form.dart';
import 'package:zakatku/widgets/hitung_zakat/form/zakat_mal_form.dart';
import 'package:zakatku/widgets/hitung_zakat/form/zakat_penghasilan_form.dart';
import 'package:zakatku/widgets/hitung_zakat/form/zakat_perdagangan_form.dart';
import 'package:zakatku/widgets/hitung_zakat/form/zakat_pertanian_form.dart';
import 'package:zakatku/widgets/hitung_zakat/form/zakat_rikaz_form.dart';

Widget getZakatCalculatorForm(
    ZakatId zakatId, GlobalKey<FormState> formKey, ZakatController controller) {
  Widget result;
  switch (zakatId) {
    case (ZakatId.fitrah):
      result = ZakatFitrahForm(formKey: formKey, controller: controller);
      break;
    case (ZakatId.rikaz):
      result = ZakatRikazForm(formKey: formKey, controller: controller);
      break;
    case (ZakatId.penghasilan):
      result = ZakatPenghasilanForm(formKey: formKey, controller: controller);
      break;
    case (ZakatId.perdagangan):
      result = ZakatPerdaganganForm(formKey: formKey, controller: controller);
      break;
    case (ZakatId.mal):
      result = ZakatMalForm(formKey: formKey, controller: controller);
      break;
    case (ZakatId.pertanian):
      result = ZakatPertanianForm(formKey: formKey, controller: controller);
      break;
    case (ZakatId.hewanTernak):
      result = ZakatHewanTernakForm(formKey: formKey, controller: controller);
      break;
    default:
      result = ZakatFitrahForm(formKey: formKey, controller: controller);
  }
  return result;
}
