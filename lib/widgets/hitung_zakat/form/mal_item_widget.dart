import 'package:flutter/material.dart';
import 'package:zakatku/model/zakat_controller.dart';
import 'package:zakatku/widgets/common/title_text_field.dart';

import '../../../constants.dart';
import '../../../utils.dart';

class MalItemWidget extends StatelessWidget {
  const MalItemWidget({
    Key? key,
    required this.type,
    required this.controller,
    this.initialUnitValue = 0,
    this.unit = "",
    required this.idx
  }) : super(key: key);

  final String type;
  final int initialUnitValue;
  final String unit;
  final ZakatController controller;
  final int idx;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleTextField(
          title: type,
          onChanged: (value) { controller.changeValue(value, "${idx}-unit"); },
          validator: (value) {
            if (isInteger(value)) {
              return null;
            }
            return "Input harus berupa bilangan bulat";
          },
          initialValue: "0",
          widthRatio: this.unit == "" ? 0.5 : 0.5,
        ),
        this.unit != ""
            ? Container(
                width: 100,
                child: TextFormField(
                  onChanged: (val) {controller.changeValue(val, "${idx}-kadar");},
                  validator: (value) {
                    if (isInteger(value)) {
                      return null;
                    }
                    return "Input harus berupa bilangan bulat";
                  },
                  keyboardType: TextInputType.number,
                  initialValue: initialUnitValue.toString(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: kDefaultPadding,
                        bottom: 0.5 * kDefaultPadding,
                        right: kDefaultPadding,
                        left: 0.5 * kDefaultPadding),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kBlackColor2, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor, width: 1),
                    ),
                    suffix: Text(
                        unit,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: kBlackColor2
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                width: 100,
                padding: EdgeInsets.only(
                    top: 0.75 * kDefaultPadding,
                    bottom: 0.675 * kDefaultPadding),
                decoration:
                    BoxDecoration(
                        border: Border.all(color: kBlackColor2),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Rupiah",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: kBlackColor2
                  ),
                )
        ),
        InkWell(
          onTap: () {
            controller.changeValue("0.0", "${idx}-remove");
          },
          child: Icon(
            Icons.cancel,
            size: 30,
            color: kRedColor,
          ),
        )
      ],
    );
  }
}
