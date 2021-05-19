import 'package:flutter/material.dart';
import 'package:zakatku/model/calculator/zakat_calculator.dart';
import 'package:zakatku/model/zakat_controller.dart';
import 'package:zakatku/widgets/common/title_text_field.dart';

import '../../../utils.dart';

class ZakatPenghasilanForm extends StatelessWidget {
  const ZakatPenghasilanForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.onChange,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;
  final void Function(String, String) onChange;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TitleTextField(
              title: "Jumlah Penghasilan Perbulan",
            onChanged: (value) { onChange(value, "nettValue"); },
              validator: (value) {
                if (isInteger(value)) {
                  return null;
                }
                return "Input harus berupa bilangan bulat";
              },
            initialValue: "0",
          ),
        ],
      ),
    );
  }
}
