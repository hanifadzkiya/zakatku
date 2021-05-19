import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zakatku/widgets/common/app_title.dart';
import 'package:zakatku/widgets/common/arrow_back.dart';

import '../../constants.dart';

class EditRemainderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kGreyColor,
        appBar: AppBar(
        leading: ArrowBack(),
    title: AppTitle(),
    centerTitle: true,
    elevation: 0,
    ),body: Text("Edit Remainder"));
  }

}