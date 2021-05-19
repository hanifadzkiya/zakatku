import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakatku/constants.dart';
import 'package:zakatku/model/calculator/zakat_pertanian_calculator.dart';
import 'package:zakatku/model/zakat_controller.dart';
import 'package:zakatku/model/zakatitem/zakat_pertanian_item.dart';
import 'package:zakatku/utils.dart';
import 'package:zakatku/widgets/common/title_text_field.dart';

class ZakatPertanianForm extends StatelessWidget {
  const ZakatPertanianForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.onChange,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final void Function(String, String) onChange;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ZakatController>(

        init: Get.find<ZakatController>(),
        builder: (controller) {
          ZakatPertanianCalculator calculator =
            controller.calculator.value as ZakatPertanianCalculator;
          return Form(
            key: _formKey,
            child: Column(
              children: [
                TitleTextField(
                    title: "Total Berat (Gram)",
                    onChanged: (value) { onChange(value, "weight"); },
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
              onTap: () => changeWaterSupply(context, onChange),
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
                        waterSupplyTypes[calculator.item.waterSupplyIdx].description,
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
      BuildContext context, void Function(String, String) onChange) async {
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
        onChange(type!, "waterSupply");
        // dialog dismissed
        break;
    }
  }
}
