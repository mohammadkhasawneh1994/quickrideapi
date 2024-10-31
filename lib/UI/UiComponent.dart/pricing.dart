import 'package:flutter/material.dart';
import 'package:tam_drive/UI/orderList.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/models/get/order.dart';
import 'package:tam_drive/core/models/views/distance.dart';
import 'package:tam_drive/helpers/checkoutManager.dart';

class Pricing extends StatefulWidget {
  final Order order;

  Pricing({super.key, required this.order});

  @override
  State<Pricing> createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  Distance _distance = Distance(km: 0);
  @override
  void initState() {
    ManageCheckout manageCheckout = ManageCheckout();
    manageCheckout.checkoutByOrder(widget.order).then((value) {
      setState(() {
        _distance = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: size.width * .75,
              height: size.height * .07,
              decoration: const BoxDecoration(
                  color: TamColors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Center(
                  child: Text(
                "${_distance.price.toString()} JOD",
                style: const TextStyle(fontSize: 30),
              ))),
          Container(
            width: size.width * .2,
            height: size.height * .07,
            decoration: const BoxDecoration(
                color: TamColors.violet,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext builder) => OrderList(
                          state: "0",
                        )));
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
