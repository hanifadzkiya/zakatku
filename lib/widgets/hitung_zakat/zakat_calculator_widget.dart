import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakatku/model/calculator/zakat_calculator.dart';
import 'package:zakatku/model/zakat_controller.dart';
import 'package:zakatku/widgets/common/form_button.dart';
import 'package:zakatku/widgets/common/title_menu.dart';
import 'package:zakatku/widgets/common/title_text_field.dart';
import 'package:zakatku/widgets/hitung_zakat/form/form_factory.dart';

import '../../constants.dart';
import '../../utils.dart';
import 'form/zakat_fitrah_form.dart';

class ZakatCalculatorWidget extends StatefulWidget {
  final ZakatItem zakatItem;

  ZakatCalculatorWidget({Key? key, required this.zakatItem}) : super(key: key);

  @override
  _ZakatCalculatorWidget createState() => _ZakatCalculatorWidget();
}

class _ZakatCalculatorWidget extends State<ZakatCalculatorWidget> {
  final _formKey = GlobalKey<FormState>();
  bool showResult = false;
  late final ZakatController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(
        ZakatController(ZakatCalculator.getInstance(widget.zakatItem.id)));
  }

  @override
  Widget build(BuildContext context) {
    ZakatCalculator controllerValue = controller.calculator.value;
    return Column(children: [
      getZakatCalculatorForm(widget.zakatItem.id, _formKey, controller.changeValue),
      TitleMenu(title: "Nishab : ${controllerValue.printNishab()}"),
      InkWell(
        onTap: submit,
        child: FormButton(title: "Hitung Zakat"),
      ),
      Opacity(
        opacity: showResult ? 1 : 0,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(0.5 * kDefaultPadding)),
                border: Border.all(color: kPrimaryColor, width: 0.5)),
            child: Column(
              children: [
                Text(
                  "Jumlah zakat",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: kDefaultPadding),
                Container(
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.all(
                          Radius.circular(0.5 * kDefaultPadding))),
                  child: GetBuilder<ZakatController>(
                      init: controller,
                      builder: (controller) {
                        return Text(
                          controllerValue.result,
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        );
                      }),
                )
              ],
            )),
      )
    ]);
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        showResult = true;
      });
      controller.calculate();
      return;
    }
  }
}
