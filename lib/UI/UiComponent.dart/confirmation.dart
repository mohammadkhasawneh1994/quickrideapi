import 'package:flutter/material.dart';
import 'package:tam_drive/UI/UiComponent.dart/TamDescButton.dart';
import 'package:tam_drive/UI/orderList.dart';
import 'package:tam_drive/business/manageTrip.dart';
import 'package:tam_drive/core/constants/extension.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/models/get/order.dart';
import 'package:tam_drive/core/models/put/confirmOrder.dart';
import 'package:tam_drive/helpers/sessionManager.dart';
import 'package:tam_drive/UI/error.dart' as er;

// ignore: must_be_immutable
class Cofirmation extends StatelessWidget {
  final Order order;
  TripManager tripManager = TripManager();
  Cofirmation({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TamDescButton(
          onPressed: () async {
            var confirm = ConfirmTrip();
            var userId = await ManageSession.getValue(SessionKeys.userId);
            confirm.driver = userId;
            await tripManager.confirmTrip(order.id!, confirm);
            tripManager.res.replaceIfElse(
                context,
                OrderList(
                  state: "1",
                ),
                er.Error(result: tripManager.res));
          },
          label: "قبول",
          icon: Icons.done_all,
          width: 100,
        ),
        TamDescButton(
          onPressed: () {
            Navigator.pop(context);
          },
          label: "رفض",
          icon: Icons.cancel,
          width: 100,
        ),
      ],
    );
  }
}
