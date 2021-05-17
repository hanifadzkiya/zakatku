
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zakatku/constants.dart';
import 'package:zakatku/model/FormContoller.dart';
import 'package:zakatku/service/PriceService.dart';

class GlobalSettingController extends GetxController implements FormController {
  GlobalSettingController() {
    settingStorage = GetStorage();

    this.goldPrice = settingStorage.read('goldPrice') ?? 900000;
    this.silverPrice = settingStorage.read('silverPrice') ?? 14000;
    this.latestGoldPrice = settingStorage.read('latestGoldPrice') ?? 900000;
    this.latestSilverPrice = settingStorage.read("latestSilverPrice") ?? 14000;
    this.latestGoldPriceUpdate = settingStorage.read("latestGoldPriceUpdate");
    this.latestSilverPriceUpdate = settingStorage.read("latestSilverPriceUpdate");
    this.nishabTypeIdx = settingStorage.read('nishabTypeIdx') ?? 0;
    this.useCustomGoldPrice = settingStorage.read('customGoldPrice') ?? true;
    this.useCustomSilverPrice = settingStorage.read('customSilverPrice') ?? true;
    this._isChanged = false;

    this.goldPriceService = new GoldPriceService();
    this.silverPriceService = new SilverPriceService();
  }

  late final GetStorage settingStorage;
  late double goldPrice;
  late double silverPrice;
  late double latestGoldPrice;
  late double latestSilverPrice;
  late DateTime latestGoldPriceUpdate;
  late DateTime latestSilverPriceUpdate;
  late bool useCustomGoldPrice;
  late bool useCustomSilverPrice;
  late int nishabTypeIdx;
  late bool _isChanged;
  late GoldPriceService goldPriceService;
  late SilverPriceService silverPriceService;

  static final double defaultGoldPrice = 900000.00;
  static final double defaultSilverPrice = 14000.00;
  static final int defaultNishabTypeIdx = 0;

  bool get isChanged => _isChanged;

  void changeValue(String value, String field) {
    _isChanged = true;
    switch(field) {
      case("goldPrice"):
        goldPrice = double.parse(value);
        break;
      case("silverPrice"):
        silverPrice = double.parse(value);
        break;
      case("nishabTypeIdx"):
        nishabTypeIdx = int.parse(value);
        break;
      case("customGoldPrice"):
        useCustomGoldPrice = value.toLowerCase() == 'true';
        settingStorage.write("customGoldPrice", this.useCustomGoldPrice);
        break;
      case("customSilverPrice"):
        useCustomSilverPrice = value.toLowerCase() == 'true';
        settingStorage.write("customSilverPrice", this.useCustomSilverPrice);
        break;
      default:
        return;
    }
    update();
  }

  void saveChange() {
    settingStorage.write("goldPrice", this.goldPrice);
    settingStorage.write("silverPrice", this.silverPrice);
    settingStorage.write("nishabTypeIdx", this.nishabTypeIdx);
    _isChanged = false;
    update();
  }

  void reset() {
    goldPrice = defaultGoldPrice;
    silverPrice = defaultSilverPrice;
    nishabTypeIdx = defaultNishabTypeIdx;
    useCustomGoldPrice = true;
    settingStorage.write("customGoldPrice", useCustomGoldPrice);
    useCustomSilverPrice = true;
    settingStorage.write("customSilverPrice", useCustomSilverPrice);
    settingStorage.remove("goldPrice");
    settingStorage.remove("silverPrice");
    settingStorage.remove("nishabTypeIdx");
    update();
  }

  Future<double> getLatestGoldPrice() async {
    if (latestGoldPriceUpdate != null) {
      final now = DateTime.now();
      final diff = now
          .difference(latestGoldPriceUpdate)
          .inDays;
      if (diff == 0 && now.day == latestGoldPriceUpdate.day) {
        return latestGoldPrice;
      }
    }

    this.latestGoldPrice = await this.goldPriceService.execute();
    this.goldPrice = this.latestGoldPrice;
    this.latestGoldPriceUpdate = DateTime.now();
    settingStorage.write("latestGoldPrice", this.latestGoldPrice);
    settingStorage.write("latestGoldPriceUpdate", this.latestGoldPriceUpdate);

    return this.latestGoldPrice;
  }

  Future<double> getLatestSilverPrice() async {
    if (latestSilverPriceUpdate != null) {
      final now = DateTime.now();
      final diff = now
          .difference(latestSilverPriceUpdate)
          .inDays;
      if (diff == 0 && now.day == latestGoldPriceUpdate.day) {
        return latestSilverPrice;
      }
    }

    this.latestSilverPrice = await this.silverPriceService.execute();
    this.silverPrice = this.latestSilverPrice;
    this.latestSilverPriceUpdate = DateTime.now();
    settingStorage.write("latestSilverPrice", this.latestSilverPrice);
    settingStorage.write("latestSilverPriceUpdate", this.latestSilverPriceUpdate);

    return this.latestSilverPrice;
  }
}
