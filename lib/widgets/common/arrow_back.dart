import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: Get.back,
        child: Icon(Icons.arrow_back)
    );
  }
}
