import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zakatku/constants.dart';
import 'package:zakatku/widgets/hitung_zakat/hitung_zakat.dart';
import 'package:zakatku/widgets/home/home_page.dart';
import 'package:zakatku/widgets/main_page.dart';
import 'package:zakatku/widgets/remainder/add_remainder_page.dart';
import 'package:zakatku/widgets/remainder/edit_remainder_page.dart';

enum AppPage { home, zakatCalculator, editRemainder, addRemainder }

extension PageExtension on AppPage {
  String get url {
    switch (this) {
      case AppPage.home:
        return '/';
      case AppPage.zakatCalculator:
        return '/zakat';
      case AppPage.editRemainder:
        return "/remainder/add";
      case AppPage.editRemainder:
        return '/remainder/edit';
      case AppPage.addRemainder:
        return "/addRemainder";
      default:
        return '/';
    }
  }
}

final routes = [
  GetPage(name: AppPage.home.url, page: () => MainPage()),
  GetPage(name: AppPage.zakatCalculator.url, page: () => ZakatCalculatorPage()),
  GetPage(name: AppPage.addRemainder.url, page: () => AddRemainderPage()),
  GetPage(name: AppPage.editRemainder.url, page: () => EditRemainderPage()),

];
