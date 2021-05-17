import 'package:flutter/material.dart';

import '../../constants.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    Key? key, required this.title, this.backgroundColor = kPrimaryColor, this.widthRatio = 0.5
  }) : super(key: key);

  final String title;
  final Color backgroundColor;
  final double widthRatio;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      padding: EdgeInsets.symmetric(vertical: 0.8 * kDefaultPadding),
      height: 60,
      width: size.width * widthRatio,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Text(title,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: kGreyColor)),
    );
  }
}