import 'package:flutter/material.dart';

import '../../constants.dart';

class TitleMenu extends StatelessWidget {
  const TitleMenu({
    Key? key, required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: kDefaultPadding
      ),
      padding: EdgeInsets.only(
          bottom: 0.4 * kDefaultPadding
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: kPrimaryColor
              )
          )
      ),
      child: Text(
          title,
          style: Theme.of(context).textTheme.headline6?.copyWith(
            color: kBlackColor2,
          )
      ),
    );
  }
}
