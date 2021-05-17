import 'package:flutter/cupertino.dart';

import '../../constants.dart';
import 'laz_card.dart';

class LazList extends StatelessWidget {
  const LazList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: lazItems.length,
        itemBuilder: (context, index) {
          return LazCard(lazItems[index]);
        },
      ),
    );
  }
}