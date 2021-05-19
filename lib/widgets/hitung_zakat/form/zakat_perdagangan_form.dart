import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zakatku/constants.dart';
import 'package:zakatku/model/calculator/zakat_calculator.dart';
import 'package:zakatku/model/zakat_controller.dart';
import 'package:zakatku/widgets/common/title_text_field.dart';

import '../../../utils.dart';

class ZakatPerdaganganForm extends StatelessWidget {
  const ZakatPerdaganganForm({
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
              title: "Nilai Barang",
            onChanged: (value) { onChange(value, "nilaiBarangDagangan"); },
              validator: (value) {
                if (isNumeric(value)) {
                  return null;
                }
                return "Input harus berupa bilangan bulat";
              },
            initialValue: "0",
          ),
          SizedBox(height: 0.5*kDefaultPadding),
          TitleTextField(
              title: "Jumlah Uang Kas",
            onChanged: (value) { onChange(value, "uang"); },
              validator: (value) {
                if (isNumeric(value)) {
                  return null;
                }
                return "Input harus berupa bilangan numerik";
              },
            initialValue: "0",
          ),
          SizedBox(height: 0.5*kDefaultPadding),
          TitleTextField(
              title: "Jumlah Piutang",
            onChanged: (value) { onChange(value, "piutang"); },
              validator: (value) {
                if (isNumeric(value)) {
                  return null;
                }
                return "Input harus berupa bilangan numerik";
              },
            initialValue: "0",
          ),
          SizedBox(height: 0.5*kDefaultPadding),
          TitleTextField(
              title: "Jumlah Hutang",
              textInputFormatter: [FilteringTextInputFormatter.allow(RegExp('^(?!\\.)([0-9.]+)\$'))],
            onChanged: (value) {onChange(value, "hutang"); },
              validator: (value) {
                if (isNumeric(value)) {
                  return null;
                }
                return "Input harus berupa bilangan numerik";
              },
            initialValue: "0",
          ),
        ],
      ),
    );
  }
}