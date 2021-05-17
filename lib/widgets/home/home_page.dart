import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zakatku/constants.dart';
import 'package:zakatku/widgets/common/app_title.dart';
import 'package:zakatku/widgets/common/bottom_nav_bar.dart';
import 'package:zakatku/widgets/common/title_menu.dart';

import 'laz_list.dart';
import 'zakat_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          right: kDefaultPadding,
          left: kDefaultPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleMenu(title: "Hitung Zakat"),
              ZakatList(),
              TitleMenu(title: "Lembaga Zakat"),
              LazList(),
              SizedBox(height: kDefaultPadding)
            ],
          ),
        ));
  }
}
