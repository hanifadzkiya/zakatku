import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zakatku/model/FormContoller.dart';
import 'package:zakatku/model/calculator/zakat_calculator.dart';
import 'package:zakatku/model/zakat_controller.dart';

import '../../constants.dart';

class TitleTextField extends StatelessWidget {
  TitleTextField({
    Key? key,
    required this.title,
    required this.validator, this.initialValue = "", this.widthRatio = 1, this.suffix, this.readOnly = false, this.onChanged, this.textInputFormatter
  }) : super(key: key);

  final String title;
  final void Function(String)? onChanged;
  final String? Function(String?) validator;
  final String initialValue;
  final double widthRatio;
  final Widget? suffix;
  final bool readOnly;
  final List<TextInputFormatter>? textInputFormatter;

  @override
  Widget build(BuildContext context) {
    log("Rebuild text field ${initialValue}");
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Container(
                width: (size.width - 2 * kDefaultPadding) * widthRatio,
                child: TextFormField(
                  inputFormatters: textInputFormatter,
                  key: ValueKey(initialValue),
                  onChanged: onChanged,
                  validator: validator,
                  keyboardType: TextInputType.number,
                  cursorColor: kPrimaryColor,
                  initialValue: initialValue,
                  readOnly: readOnly,
                  decoration: InputDecoration(
                    suffix: suffix,
                    contentPadding: EdgeInsets.only(
                      top: kDefaultPadding,
                      bottom: 0.5 * kDefaultPadding,
                      right: kDefaultPadding,
                      left: 0.5 * kDefaultPadding
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kBlackColor2, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor, width: 1),
                    ),
                  ),
                ),
              )
          ),
        Positioned(
          top: 0,
          left: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 0.3 * kDefaultPadding),
            decoration: BoxDecoration(color: kGreyColor),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: kPrimaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
