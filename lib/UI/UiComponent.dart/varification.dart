import 'package:flutter/material.dart';
import 'package:tam_drive/UI/orderList.dart';
import 'package:tam_drive/business/manageTrip.dart';
import 'package:tam_drive/core/constants/extension.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/models/get/order.dart';
import 'package:tam_drive/core/models/put/varifyTrip.dart';
import 'package:tam_drive/UI/error.dart' as er;

// ignore: must_be_immutable
class Varification extends StatelessWidget {
  final Order order;
  TripManager tripManager = TripManager();
  Varification({super.key, required this.order});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: size.width * .4,
              height: size.height * .07,
              decoration: const BoxDecoration(
                  color: TamColors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  label: Text('كود الرحله'),
                ),
              ),
            ),
          ),
          Container(
            width: size.width * .2,
            height: size.height * .07,
            decoration: const BoxDecoration(
                color: TamColors.violet,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            child: IconButton(
              onPressed: () async {
                var varify = VarifyTrip();
                varify.code = Code();
                varify.code!.data = controller.text;
                await tripManager.varifyTrip(order.id!, varify);
                tripManager.res.replaceIfElse(
                    context,
                    OrderList(
                      state: "2",
                    ),
                    er.Error(result: tripManager.res));
              },
              icon: const Icon(Icons.done),
              color: TamColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
