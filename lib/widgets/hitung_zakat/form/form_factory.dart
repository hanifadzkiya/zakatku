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
    ZakatId zakatId, GlobalKey<FormState> formKey, void Function(String, String) onChange) {
  Widget result;
  switch (zakatId) {
    case (ZakatId.fitrah):
      result = ZakatFitrahForm(formKey: formKey, onChange: onChange);
      break;
    case (ZakatId.rikaz):
      result = ZakatRikazForm(formKey: formKey, onChange: onChange);
      break;
    case (ZakatId.penghasilan):
      result = ZakatPenghasilanForm(formKey: formKey, onChange: onChange);
      break;
    case (ZakatId.perdagangan):
      result = ZakatPerdaganganForm(formKey: formKey, onChange: onChange);
      break;
    case (ZakatId.mal):
      result = ZakatMalForm(formKey: formKey, onChange: onChange);
      break;
    case (ZakatId.pertanian):
      result = ZakatPertanianForm(formKey: formKey, onChange: onChange);
      break;
    case (ZakatId.hewanTernak):
      result = ZakatHewanTernakForm(formKey: formKey, onChange: onChange);
      break;
    default:
      result = ZakatFitrahForm(formKey: formKey, onChange: onChange);
  }
  return result;
}
