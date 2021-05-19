import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zakatku/routes/routes.dart';

import '../../constants.dart';

class RemainderItemCard extends StatelessWidget {
  const RemainderItemCard({
    Key? key, required this.icon, required this.description, required this.title, required this.descriptionColor,
  }) : super(key: key);

  final String icon;
  final String description;
  final String title;
  final Color descriptionColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {Get.toNamed(AppPage.editRemainder.url);},
      child: Container(
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(0.6 * kDefaultPadding)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: kDefaultPadding),
            SvgPicture.asset(icon,width: 25, height: 25,color: kBlackColor2,),
            SizedBox(width: kDefaultPadding * 0.5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      title,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: kBlackColor2,
                          fontWeight:  FontWeight.w300
                      )
                  ),
                  SizedBox(height: 0.3 * kDefaultPadding),
                  Text(description,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: descriptionColor,
                          fontWeight: FontWeight.w300
                      ))
                ],
              ),
            ),
            Icon(
                Icons.chevron_right,
                color: kBlackColor2
            ),
            SizedBox(width: kDefaultPadding),
          ],
        ),
      ),
    );
  }
}
