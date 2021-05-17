// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zakatku/constants.dart';
import 'package:zakatku/widgets/hitung_zakat/hitung_zakat.dart';
import 'package:zakatku/widgets/home/home_page.dart';

import 'routes/routes.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kGreyColor,
          dividerColor: Colors.transparent
      ),
        initialRoute: '/',
        getPages: routes,
    );
  }
}
