import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_select/smart_select.dart';
import 'package:zakatku/routes/routes.dart';
import 'package:zakatku/service/NotificationService.dart';
import 'package:zakatku/widgets/remainder/remainder_item_card.dart';

import '../../constants.dart';

class RemainderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    NotificationService().sendNotification();
    return Container(
        margin: EdgeInsets.only(
          right: kDefaultPadding,
          left: kDefaultPadding,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RemainderItemCard(
                  icon: "assets/icons/gold.svg",
                  description: "Belum memenuhi nishab",
                  title: "Zakat Mal",
                  descriptionColor: kRedColor,
                ),
                SizedBox(height: kDefaultPadding),
                RemainderItemCard(
                  icon: "assets/icons/gold.svg",
                  description: "Pembayaran berikutnya 17/05/2021",
                  title: "Zakat Mal",
                  descriptionColor: kPrimaryColor,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(bottom: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding * 0.2),
                  decoration: BoxDecoration(
                    color: kGreyColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 4,
                        offset: Offset(0, 0), // changes position of shadow
                      )
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      addItem(context, (val) {
                        Get.toNamed(AppPage.addRemainder.url, arguments: val);
                      });
                    },
                    child: Icon(
                      Icons.add,
                      color: kPrimaryColor,
                      size: 40,
                    ),
                  )),
            ),
          ],
        ));
  }

  Future<void> addItem(
      BuildContext context, void Function(ZakatId) onSelect) async {
    ZakatId? zakatId = await showDialog<ZakatId>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Tambah Pengingat Zakat',
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: kPrimaryColor)),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, ZakatId.penghasilan);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.5 * kDefaultPadding),
                  child: const Text('Zakat Penghasilan'),
                ),
              ),
            ],
          );
        });
    switch (zakatId) {
      case ZakatId.penghasilan:
        onSelect(zakatId!);
        break;
      default:
        // dialog dismissed
        break;
    }
  }
}
