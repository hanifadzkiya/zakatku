import 'package:flutter/cupertino.dart';
import 'package:zakatku/widgets/common/Card.dart';

import '../../constants.dart';

class LazCard extends CarouselCard {
  LazCard(LazItem lazItem) : super(
      icon: Image.asset(lazItem.icon, fit: BoxFit.fill),
      title: lazItem.name
  );
}
