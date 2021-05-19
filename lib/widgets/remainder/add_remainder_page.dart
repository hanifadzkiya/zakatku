import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:smart_select/smart_select.dart';
import 'package:zakatku/model/calculator/zakat_calculator.dart';
import 'package:zakatku/model/zakat_controller.dart';
import 'package:zakatku/utils.dart';
import 'package:zakatku/widgets/common/title_menu.dart';
import 'package:zakatku/widgets/hitung_zakat/form/form_factory.dart';

import '../../constants.dart';

class AddRemainderPage extends StatefulWidget {
  @override
  _AddRemainderPageState createState() => _AddRemainderPageState();
}

class _AddRemainderPageState extends State<AddRemainderPage> {
  final _formKey = GlobalKey<FormState>();
  ZakatController controller =
      Get.put(ZakatController(ZakatCalculator.getInstance(Get.arguments)));

  List<S2Choice<String>> options =
      nishabTypeOptions.asMap().entries.map((entry) {
    int idx = entry.key;
    NishabType val = entry.value;
    return S2Choice<String>(
        value: idx.toString(),
        title:
            "${val.type} ${val.val.toStringAsFixed(2)} Gram (${val.version})");
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyColor,
      appBar: AppBar(
        title: Text("Tambah Pengingat"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TitleMenu(title: "Pengaturan Harta"),
              getZakatCalculatorForm(Get.arguments, _formKey, controller.changeValue),
              TitleMenu(title: "Pengaturan Nishab"),
              SmartSelect<String>.single(
                  key: ValueKey("0"),
                  title: 'Tipe Nishab',
                  value: "0",
                  choiceItems: options,
                  onChange: (state) =>
                      controller.changeValue(state.value, "nishabTypeIdx")),
              TitleMenu(title: "Pengaturan Haul"),
              TitleMenu(title: "Pengaturan Pengingat"),
              InkWell(
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2018, 3, 5),
                      maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.id);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(0.7 * kDefaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: kBlackColor2
                    ),
                    borderRadius: BorderRadius.circular(
                      5
                    )
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.alarm),
                      SizedBox(width: kDefaultPadding),
                      Text(formattedDate(DateTime.now())),
                    ],
                  ),
                ),
              )
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
                padding: EdgeInsets.all(kDefaultPadding),
                child: Text("Simpan Pengingat",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: kWhiteColor,
                        fontSize: 16))),
          )
        ],
      ),
    );
  }
}
