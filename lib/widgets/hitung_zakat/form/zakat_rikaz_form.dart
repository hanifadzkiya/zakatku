import 'package:flutter/material.dart';
import 'package:zakatku/model/calculator/zakat_calculator.dart';
import 'package:zakatku/model/zakat_controller.dart';
import 'package:zakatku/widgets/common/title_text_field.dart';

import '../../../utils.dart';

class ZakatRikazForm extends StatelessWidget {
  const ZakatRikazForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.controller,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;
  final ZakatController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TitleTextField(
              title: "Jumlah Harta Temuan",
              onChanged: (value) { controller.changeValue(value, "nettValue"); },
              validator: (value) {
                if (isInteger(value)) {
                  return null;
                }
                return "Input harus berupa bilangan bulat";
              }),
        ],
      ),
    );
  }
}
