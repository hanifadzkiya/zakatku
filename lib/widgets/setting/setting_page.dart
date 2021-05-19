
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_select/smart_select.dart';
import 'package:zakatku/model/FormContoller.dart';
import 'package:zakatku/model/global_setting_controller.dart';
import 'package:zakatku/service/PriceService.dart';
import 'package:zakatku/utils.dart';
import 'package:zakatku/widgets/common/form_button.dart';
import 'package:zakatku/widgets/common/title_menu.dart';
import 'package:zakatku/widgets/common/title_text_field.dart';

import '../../constants.dart';

class SettingPage extends StatefulWidget {
  final PriceService _request = new GoldPriceService();
  late final GlobalSettingController _controller;

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<S2Choice<String>> options =
      nishabTypeOptions.asMap().entries.map((entry) {
    int idx = entry.key;
    NishabType val = entry.value;
    return S2Choice<String>(
        value: idx.toString(),
        title:
            "${val.type} ${val.val.toStringAsFixed(2)} Gram (${val.version})");
  }).toList();

  late final Future<double> futurePrice;

  @override
  void initState() {
    super.initState();
    this.widget._controller = Get.put(GlobalSettingController());
    futurePrice = widget._request.execute();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(
          right: kDefaultPadding,
          left: kDefaultPadding,
        ),
        child: GetBuilder<GlobalSettingController>(
            init: Get.find<GlobalSettingController>(),
            builder: (controller) {
              return Container(
                width: double.infinity,
                constraints: BoxConstraints.expand(),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleMenu(title: "Pengaturan Nishab"),
                          controller.useCustomGoldPrice
                              ? CustomPriceTextField(
                                  initialValue: controller.goldPrice,
                                  controller: controller,
                                  onChanged: (val) {
                                    controller.changeValue(val, "goldPrice");
                                  },
                                  onMethodChanged: () {
                                    controller.changeValue(
                                        "false", "customGoldPrice");
                                  },
                                  idField: 'goldPrice',
                                  title: 'Harga Emas per Gram',
                                )
                              : FutureBuilder<double>(
                                  future: controller.getLatestGoldPrice(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return LatestPriceTextField(
                                        lastUpdate:
                                            controller.latestGoldPriceUpdate,
                                        price: snapshot.data!,
                                        onMethodChange: () {
                                          controller.changeValue(
                                              "true", "customGoldPrice");
                                        },
                                        title: 'Harga Emas per Gram',
                                        controller: controller,
                                      );
                                    }
                                    return TitleTextField(
                                      title: "Harga Emas per Gram",
                                      onChanged: (value) {  },
                                      validator: (val) {
                                        return null;
                                      },
                                      readOnly: true,
                                    );
                                  }),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          controller.useCustomSilverPrice
                              ? CustomPriceTextField(
                                  initialValue: controller.silverPrice,
                                  controller: controller,
                                  onChanged: (val) {
                                    controller.changeValue(val, "silverPrice");
                                  },
                                  onMethodChanged: () {
                                    controller.changeValue(
                                        "false", "customSilverPrice");
                                  },
                                  idField: 'silverPrice',
                                  title: 'Harga Perak per Gram',
                                )
                              : FutureBuilder<double>(
                                  future: controller.getLatestSilverPrice(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return LatestPriceTextField(
                                        lastUpdate:
                                            controller.latestSilverPriceUpdate,
                                        price: snapshot.data!,
                                        onMethodChange: () {
                                          controller.changeValue(
                                              "true", "customSilverPrice");
                                        },
                                        title: 'Harga Perak per Gram',
                                        controller: controller,
                                      );
                                    }
                                    return TitleTextField(
                                      title: "Harga Perak per Gram",
                                      onChanged: (value) { },
                                      validator: (val) {
                                        return null;
                                      },
                                      readOnly: true,
                                    );
                                  }),
                          SizedBox(height: kDefaultPadding),
                          SmartSelect<String>.single(
                              key:
                                  ValueKey(controller.nishabTypeIdx.toString()),
                              title: 'Tipe Nishab',
                              value: controller.nishabTypeIdx.toString(),
                              choiceItems: options,
                              onChange: (state) => controller.changeValue(
                                  state.value, "nishabTypeIdx"))
                        ],
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: controller.isChanged
                                    ? controller.saveChange
                                    : () {},
                                child: FormButton(
                                  title: "Simpan",
                                  widthRatio: 0.25,
                                  backgroundColor: controller.isChanged
                                      ? kPrimaryColor
                                      : Colors.black38,
                                )),
                            SizedBox(width: kDefaultPadding),
                            InkWell(
                                onTap: controller.reset,
                                child: FormButton(
                                  title: "Reset",
                                  widthRatio: 0.25,
                                  backgroundColor: kRedColor,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}

class LatestPriceTextField extends StatelessWidget {
  const LatestPriceTextField({
    Key? key,
    required this.controller,
    required this.price,
    required this.onMethodChange,
    required this.lastUpdate,
    required this.title,
  }) : super(key: key);

  final FormController controller;
  final double price;
  final VoidCallback onMethodChange;
  final DateTime lastUpdate;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextField(
          validator: (String? val) {
            return null;
          },
          readOnly: true,
          title: title,
          initialValue: doubleToCurrency(this.price),
          suffix: InkWell(
            onTap: onMethodChange,
            child: Container(
                color: kGreyColor,
                padding: EdgeInsets.only(left: kDefaultPadding * 0.8),
                child: Text("Edit Harga")),
          ),
        ),
        Text(
            "Terakhir diperbarui: ${formattedDate(lastUpdate)}")
      ],
    );
  }
}

class CustomPriceTextField extends StatelessWidget {
  const CustomPriceTextField(
      {Key? key,
      required this.onChanged,
      required this.controller,
      required this.initialValue,
      required this.onMethodChanged,
      required this.title,
      required this.idField})
      : super(key: key);

  final void Function(String) onChanged;
  final VoidCallback onMethodChanged;
  final FormController controller;
  final double initialValue;
  final String title;
  final String idField;

  @override
  Widget build(BuildContext context) {
    return TitleTextField(
        title: title,
        onChanged: onChanged,
        validator: (value) => null,
        initialValue: initialValue.toStringAsFixed(2),
        suffix: InkWell(
          onTap: onMethodChanged,
          child: Container(
              color: kGreyColor,
              padding: EdgeInsets.only(left: kDefaultPadding * 0.8),
              child: Text("Gunakan harga asli")),
        ));
  }
}
