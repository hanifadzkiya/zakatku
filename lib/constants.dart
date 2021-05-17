import 'dart:ui';

import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF00AB6B);
const kGreyColor = Color(0xFFEDEDED);
const kWhiteColor = Colors.white;
const kBlackColor = Colors.black87;
final kBlackColor2 = Colors.black.withOpacity(0.7);
const kDefaultPadding = 20.0;
const kRedColor = Color(0xffff3547);

class ZakatItem {
  final String _name;
  final String _icon;
  final ZakatId _id;

  const ZakatItem(_id, name, icon)
      : this._id = _id,
        this._name = name,
        this._icon = icon;

  String get name => _name;
  String get icon => _icon;
  ZakatId get id => _id;
}

const zakatList = [
  ZakatItem(ZakatId.fitrah, "Zakat Fitrah", "assets/icons/rice.svg"),
  ZakatItem(ZakatId.mal, "Zakat Mal", "assets/icons/gold.svg"),
  ZakatItem(ZakatId.penghasilan, "Zakat Penghasilan", "assets/icons/salary.svg"),
  ZakatItem(ZakatId.pertanian, "Zakat Pertanian", "assets/icons/plant.svg"),
  ZakatItem(ZakatId.perdagangan, "Zakat Perdagangan", "assets/icons/market.svg"),
  ZakatItem(ZakatId.rikaz, "Zakat Rikaz", "assets/icons/treasury.svg"),
  ZakatItem(ZakatId.hewanTernak, "Zakat Ternak", "assets/icons/cattle.svg"),

];

enum ZakatId {
  fitrah,
  mal,
  penghasilan,
  pertanian,
  perdagangan,
  rikaz,
  hewanTernak
}

class LazItem {
  final String _name;
  final String _icon;

  const LazItem(name, icon)
      : this._name = name,
        this._icon = icon;

  String get name => _name;
  String get icon => _icon;
}

const lazItems = [
  LazItem("Baznaz", "assets/images/baznaz.png"),
  LazItem("Daarut Tauhiid", "assets/images/dpu-dt.png"),
  LazItem("Dompet Dhuafa", "assets/images/dompetdhuafa.png"),
  LazItem("IZI", "assets/images/izi.png"),
  LazItem("Lazis MU", "assets/images/lazismu.png"),
  LazItem("Lazis NU", "assets/images/lazisnu.png"),
  LazItem("Rumah Zakat", "assets/images/rumahzakat.webp"),
  LazItem("Yatim Mandiri", "assets/images/yatimmandiri.png"),
];

class ZakatArticle {
  final String _id;
  final String _icon;

  const ZakatArticle(id, icon)
      : this._id = id,
        this._icon = icon;

  String get id => _id;
  String get icon => _icon;
}

const zakatArticleList = [
  ZakatArticle("Baznaz", "assets/images/baznaz.png"),
  ZakatArticle("Daarut Tauhiid", "assets/images/dpu-dt.png"),
];

class NishabType {

  const NishabType(this.type, this.val, this.version);

  final String type;
  final double val;
  final String version;
}

const nishabTypeOptions = [
  NishabType("Emas", 77.5, "Syafi'i, Maliki, Hanbali"),
  NishabType("Emas", 107.75, "Hanafi"),
  NishabType("Emas", 85, "Syaikh Utsaimin dan DR. Wahbah Zuhaily"),
  NishabType("Emas", 90.5, "Ali Mubarak"),
  NishabType("Emas", 84.62, "Qasim an-Nuri"),
  NishabType("Emas", 72, "Abdul Aziz Uyun"),
  NishabType("Emas", 80, "Majid al-Hamawi"),
  NishabType("Perak", 542.35, "Syafi'i, Maliki, dan Hanbali"),
  NishabType("Perak", 752.66, "Hanafi"),
  NishabType("Perak", 595, "Syaikh Utsaimin dan DR. Wahbah Zuhaily"),
  NishabType("Perak", 625, "Qasim an-Nuri"),
  NishabType("Perak", 504, "Abdul Aziz Uyun"),
];
