import 'package:flutter/material.dart';

import '../../constants.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: kPrimaryColor),
          text: "Z",
        ),
        TextSpan(
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: kBlackColor),
            text: "akatpedia")
      ]),
    );
  }
}
