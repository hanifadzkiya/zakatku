import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakatku/constants.dart';
import 'package:zakatku/model/calculator/zakat_mal_calculator.dart';
import 'package:zakatku/model/zakat_controller.dart';
import 'package:zakatku/model/zakatitem/zakat_mal_item.dart';
import 'package:zakatku/utils.dart';
import 'package:zakatku/widgets/common/title_text_field.dart';

import 'mal_item_widget.dart';

class ZakatMalForm extends StatelessWidget {
  const ZakatMalForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.onChange,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final void Function(String, String) onChange;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MalItem(onChange: onChange),
        ],
      ),
    );
  }
}

class MalItem extends StatelessWidget {
  const MalItem({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  final void Function(String, String) onChange;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ZakatController>(init: Get.find<ZakatController>(), builder: (controller) {
      ZakatMalCalculator zakatMalCalculator =
          controller.calculator.value as ZakatMalCalculator;
      List<Widget> fields =
          zakatMalCalculator.item.zakatMalItems.asMap().entries.map((entry) {
        return getFormField(entry.value, entry.key);
      }).toList();
      return Column(
        children: [
          ...fields,
          SizedBox(height: kDefaultPadding),
          InkWell(
            onTap: () {
              addItem(context, onChange);
            },
            child: Icon(
              Icons.add,
              color: kPrimaryColor,
            ),
          )
        ],
      );
    });
  }

  Widget getFormField(ZakatMalItemType item, int idx) {
    Widget result;
    log(idx.toString());
    switch (item.type) {
      case ("Emas"):
        result = MalItemWidget(
            onChange: onChange,
            type: item.type,
            unit: "Karat",
            initialUnitValue: 24,
            idx: idx,
            key: ValueKey(idx));
        break;
      case ("Perak"):
        result = MalItemWidget(
            onChange: onChange,
            type: item.type,
            unit: "%",
            initialUnitValue: 100,
            idx: idx,
            key: ValueKey(idx));
        break;
      case ("Uang"):
        result = MalItemWidget(
            onChange: onChange, type: item.type, idx: idx, key: ValueKey(idx));
        break;
      default:
        result = MalItemWidget(
            onChange: onChange, type: item.type, idx: idx, key: ValueKey(idx));
        break;
    }
    return result;
  }

  Future<void> addItem(BuildContext context, void Function(String, String) onChange) async {
    String? type = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Pilih Jenis Harta'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () { Navigator.pop(context, "Emas"); },
                child: const Text('Emas'),
              ),
              SimpleDialogOption(
                onPressed: () { Navigator.pop(context, "Perak"); },
                child: const Text('Perak'),
              ),
              SimpleDialogOption(
                onPressed: () { Navigator.pop(context, "Uang"); },
                child: const Text('Uang'),
              ),
            ],
          );
        }
    );
    switch (type) {
      default:
        onChange(type!, "add");
      // dialog dismissed
        break;
    }
  }
}
