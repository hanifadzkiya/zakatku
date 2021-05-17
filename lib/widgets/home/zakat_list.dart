import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zakatku/widgets/common/Card.dart';

import '../../constants.dart';
import 'zakat_card.dart';

class ZakatList extends StatelessWidget {
  const ZakatList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: zakatList.length,
        itemBuilder: (context, index) {
          return ZakatCard(zakatList[index]);
        },
      ),
    );
  }
}


