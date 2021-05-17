import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zakatku/routes/routes.dart';
import 'package:zakatku/widgets/common/Card.dart';

import '../../constants.dart';

class ZakatCard extends CarouselCard {
  ZakatCard(ZakatItem zakat)
      : super(
            icon: SvgPicture.asset(zakat.icon, fit: BoxFit.fill),
            title: zakat.name,
            arguments: zakat,
            url: AppPage.zakatCalculator.url);
}
