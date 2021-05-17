import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard(
      {Key? key,
      required this.icon,
      required this.title,
      this.arguments,
      this.url = "/"})
      : super(key: key);

  final Widget icon;
  final String title;
  final dynamic arguments;
  final String url;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(url, arguments: arguments);
      },
      child: Container(
        width: 180,
        height: 200,
        margin: EdgeInsets.only(right: kDefaultPadding),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(kDefaultPadding * 0.6)),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Container(
                  width: 115,
                  height: 115,
                  child: icon,
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: kGreyColor)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.5 * kDefaultPadding),
                child: Text(title,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
