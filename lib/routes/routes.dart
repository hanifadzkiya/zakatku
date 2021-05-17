import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zakatku/constants.dart';
import 'package:zakatku/widgets/hitung_zakat/hitung_zakat.dart';
import 'package:zakatku/widgets/home/home_page.dart';
import 'package:zakatku/widgets/main_page.dart';

enum AppPage { home, zakatCalculator }

extension PageExtension on AppPage {
  String get url {
    switch (this) {
      case AppPage.home:
        return '/';
      case AppPage.zakatCalculator:
        return '/zakat';
      default:
        return '/';
    }
  }
}

final routes = [
  GetPage(name: AppPage.home.url, page: () => MainPage()),
  GetPage(name: AppPage.zakatCalculator.url, page: () => ZakatCalculatorPage()),
];
