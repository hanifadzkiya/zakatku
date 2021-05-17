import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zakatku/model/calculator/zakat_calculator.dart';
import 'package:zakatku/model/zakat_controller.dart';
import 'package:zakatku/utils.dart';
import 'package:zakatku/widgets/common/app_title.dart';
import 'package:zakatku/widgets/common/arrow_back.dart';
import 'package:zakatku/widgets/common/title_text_field.dart';

import '../../constants.dart';
import 'zakat_calculator_widget.dart';

class ZakatCalculatorPage extends StatelessWidget {
  final ZakatItem zakatItem = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kGreyColor,
        appBar: AppBar(
          leading: ArrowBack(),
          title: AppTitle(),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(
              right: kDefaultPadding,
              left: kDefaultPadding,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: kDefaultPadding),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 175,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(0.5 * kDefaultPadding))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: kDefaultPadding),
                              SvgPicture.asset(
                                zakatItem.icon,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                                color: kGreyColor,
                              ),
                              SizedBox(width: kDefaultPadding),
                              Flexible(
                                child: Text(
                                  zakatItem.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(
                                        color: kGreyColor,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ExpansionTile(
                    textColor: kPrimaryColor,
                    title: Text("Informasi Zakat"),
                    children: [
                      FutureBuilder(
                          future:
                              rootBundle.loadString("assets/md/zakat${zakatItem.id.toString().split(".").last}.md"),
                          builder: (BuildContext context,
                              AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasError) {
                              snapshot.error.printError();
                              return Text("Failed to load data");
                            }
                            if (snapshot.hasData) {
                              return MarkdownBody(data: snapshot.data!);
                            }

                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ],
                    expandedAlignment: Alignment.topLeft,
                    tilePadding: EdgeInsets.symmetric(horizontal: 0.0),
                  ),
                  ExpansionTile(
                    maintainState: true,
                    textColor: kPrimaryColor,
                    title: Text("Kalkulator Zakat"),
                    children: [
                      ZakatCalculatorWidget(
                        zakatItem: zakatItem,
                      ),
                    ],
                    expandedAlignment: Alignment.topLeft,
                    tilePadding: EdgeInsets.symmetric(horizontal: 0.0),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  ZakatId getZakatId(String? id) {
    return enumFromString(ZakatId.values, id);
  }
}
