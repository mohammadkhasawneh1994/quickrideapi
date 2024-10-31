import 'package:flutter/material.dart';
import 'package:tam_drive/UI/UiComponent.dart/TamDescButton.dart';
import 'package:tam_drive/UI/orderList.dart';
import 'package:tam_drive/business/manageTrip.dart';
import 'package:tam_drive/core/constants/extension.dart';
import 'package:tam_drive/core/models/get/order.dart';
import 'package:tam_drive/UI/error.dart' as er;
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Finalization extends StatelessWidget {
  final Order order;
  TripManager tripManager = TripManager();
  Finalization({super.key, required this.order});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TamDescButton(
          onPressed: () async {
            await tripManager.finishTrip(order.id!);
            tripManager.res.replaceIfElse(
                context,
                OrderList(
                  state: "4",
                ),
                er.Error(result: tripManager.res));
          },
          label: "أنهاء",
          icon: Icons.done_all,
          width: 100,
        ),
        TamDescButton(
          onPressed: () async {
            await launchUrl(Uri.parse(
                "https://www.google.com/maps/dir/?api=1&destination=${order.dropOff!.lat},${order.dropOff!.long}&travelmode=driving"));
          },
          label: "الموقع",
          icon: Icons.location_on_outlined,
          width: 100,
        ),
      ],
    );
  }
}
