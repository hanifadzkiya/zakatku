import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakatku/constants.dart';
import 'package:zakatku/model/calculator/zakat_mal_calculator.dart';
import 'package:zakatku/model/zakat_controller.dart';
import 'package:zakatku/utils.dart';
import 'package:zakatku/widgets/common/title_text_field.dart';

import 'mal_item_widget.dart';

class ZakatMalForm extends StatelessWidget {
  const ZakatMalForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.controller,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final ZakatController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MalItem(controller: controller),
        ],
      ),
    );
  }
}

class MalItem extends StatelessWidget {
  const MalItem({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ZakatController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ZakatController>(init: controller, builder: (controller) {
      ZakatMalCalculator zakatMalCalculator =
          controller.calculator.value as ZakatMalCalculator;
      List<Widget> fields =
          zakatMalCalculator.zakatMalItems.asMap().entries.map((entry) {
        return getFormField(entry.value, entry.key);
      }).toList();
      return Column(
        children: [
          ...fields,
          SizedBox(height: kDefaultPadding),
          InkWell(
            onTap: () {
              addItem(context, controller);
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

  Widget getFormField(ZakatMalItem item, int idx) {
    Widget result;
    log(idx.toString());
    switch (item.type) {
      case ("Emas"):
        result = MalItemWidget(
            controller: controller,
            type: item.type,
            unit: "Karat",
            initialUnitValue: 24,
            idx: idx,
            key: ValueKey(idx));
        break;
      case ("Perak"):
        result = MalItemWidget(
            controller: controller,
            type: item.type,
            unit: "%",
            initialUnitValue: 100,
            idx: idx,
            key: ValueKey(idx));
        break;
      case ("Uang"):
        result = MalItemWidget(
            controller: controller, type: item.type, idx: idx, key: ValueKey(idx));
        break;
      default:
        result = MalItemWidget(
            controller: controller, type: item.type, idx: idx, key: ValueKey(idx));
        break;
    }
    return result;
  }

  Future<void> addItem(BuildContext context, ZakatController controller) async {
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
        controller.changeValue(type!, "add");
      // dialog dismissed
        break;
    }
  }
}
