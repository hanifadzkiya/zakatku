import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakatku/model/calculator/zakat_hewan_ternak_calculator.dart';
import 'package:zakatku/model/calculator/zakat_pertanian_calculator.dart';
import 'package:zakatku/model/zakat_controller.dart';
import 'package:zakatku/widgets/common/title_text_field.dart';

import '../../../constants.dart';
import '../../../utils.dart';

class ZakatHewanTernakForm extends StatelessWidget {
  const ZakatHewanTernakForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.controller,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final ZakatController controller;

  @override
  Widget build(BuildContext context) {
    ZakatHewanTernakCalculator calculator =
    controller.calculator.value as ZakatHewanTernakCalculator;
    return GetBuilder<ZakatController>(
        init: controller,
        builder: (controller) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                InkWell(
                    onTap: () => changeCattleType(context, controller),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tipe Pengairan",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: kPrimaryColor),
                        ),
                        Text(
                          cattleTypes[calculator.cattleTypeIdx].description,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: kBlackColor2),
                        ),
                      ],
                    )),
                SizedBox(
                  height: kDefaultPadding,
                ),
                TitleTextField(
                    title: "Total Ekor",
                    onChanged: (value) { controller.changeValue(value, "total"); },
                    validator: (value) {
                      if (isInteger(value)) {
                        return null;
                      }
                      return "Input harus berupa bilangan bulat";
                    }),
              ],
            ),
          );
        });
  }

  Future<void> changeCattleType(
      BuildContext context, ZakatController controller) async {
    String? type = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Jenis Hewan Ternak'),
            children: <Widget>[
              for (int i = 0; i < cattleTypes.length; i++)
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, i.toString());
                  },
                  child: Text(cattleTypes[i].description),
                )
            ],
          );
        });
    switch (type) {
      default:
        controller.changeValue(type!, "cattleType");
        // dialog dismissed
        break;
    }
  }
}
