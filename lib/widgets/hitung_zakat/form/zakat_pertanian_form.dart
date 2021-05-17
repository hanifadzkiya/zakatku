import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakatku/constants.dart';
import 'package:zakatku/model/calculator/zakat_pertanian_calculator.dart';
import 'package:zakatku/model/zakat_controller.dart';
import 'package:zakatku/utils.dart';
import 'package:zakatku/widgets/common/title_text_field.dart';

class ZakatPertanianForm extends StatelessWidget {
  const ZakatPertanianForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.controller,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final ZakatController controller;

  @override
  Widget build(BuildContext context) {
    ZakatPertanianCalculator calculator =
        controller.calculator.value as ZakatPertanianCalculator;
    return GetBuilder<ZakatController>(
        init: controller,
        builder: (controller) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                TitleTextField(
                    title: "Total Berat (Gram)",
                    onChanged: (value) { controller.changeValue(value, "weight"); },
                    validator: (value) {
                      if (isNumeric(value)) {
                        return null;
                      }
                      return "Input harus berupa bilangan numeric";
                    }),
                SizedBox(
                  height: kDefaultPadding,
                ),
            InkWell(
              onTap: () => changeWaterSupply(context, controller),
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
                        waterSupplyTypes[calculator.waterSupplyIdx].description,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: kBlackColor2),
                      ),
                  ],
                ))
              ],
            ),
          );
        });
  }

  Future<void> changeWaterSupply(
      BuildContext context, ZakatController controller) async {
    String? type = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Tipe Pengairan'),
            children: <Widget>[
              for (int i = 0; i < waterSupplyTypes.length; i++)
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, i.toString());
                  },
                  child: Text(waterSupplyTypes[i].description),
                )
            ],
          );
        });
    switch (type) {
      default:
        controller.changeValue(type!, "waterSupply");
        // dialog dismissed
        break;
    }
  }
}
