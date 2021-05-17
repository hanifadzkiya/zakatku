import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zakatku/constants.dart';
import 'package:zakatku/model/dashboard_controller.dart';
import 'package:zakatku/widgets/common/app_title.dart';
import 'package:zakatku/widgets/common/bottom_nav_bar.dart';
import 'package:zakatku/widgets/home/home_page.dart';
import 'package:zakatku/widgets/setting/setting_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: kGreyColor,
            appBar: AppBar(
              title: AppTitle(),
              centerTitle: true,
              elevation: 0,
            ),
            body: IndexedStack(
              index: controller.tabIndex,
              children: [
                Home(),
                SettingPage()
              ],
            ),
            bottomNavigationBar: BottomNavBar(
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex
            ),
          );
        },
    );
  }
}