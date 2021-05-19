import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakatku/model/calculator/zakat_hewan_ternak_calculator.dart';
import 'package:zakatku/model/calculator/zakat_pertanian_calculator.dart';
import 'package:zakatku/model/zakat_controller.dart';
import 'package:zakatku/model/zakatitem/zakat_fitrah_item.dart';
import 'package:zakatku/widgets/common/title_text_field.dart';

import '../../../constants.dart';
import '../../../utils.dart';

class ZakatHewanTernakForm extends StatelessWidget {
  const ZakatHewanTernakForm({
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
          ZakatHewanTernakCalculator calculator = controller.calculator.value as ZakatHewanTernakCalculator;
          return Form(
            key: _formKey,
            child: Column(
              children: [
                InkWell(
                    onTap: () => changeCattleType(context, onChange),
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
                          cattleTypes[calculator.item.cattleTypeIdx].description,
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
                    onChanged: (value) { onChange(value, "total"); },
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
      BuildContext context, void Function(String, String) onChange) async {
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
        onChange(type!, "cattleType");
        // dialog dismissed
        break;
    }
  }
}
