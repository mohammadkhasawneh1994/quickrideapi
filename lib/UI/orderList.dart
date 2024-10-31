import 'package:flutter/material.dart';
import 'package:tam_drive/UI/UiComponent.dart/TamDescButton.dart';
import 'package:tam_drive/UI/UiComponent.dart/orderListView.dart';
import 'package:tam_drive/business/manageTrip.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/models/get/order.dart';

class OrderList extends StatefulWidget {
  String state;
  OrderList({super.key, required this.state});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  TripManager tripManager = TripManager();
  List<Order> orders = [];
  bool isLoaded = false;
  @override
  void initState() {
    if (widget.state == "0") {
      tripManager.getTrip(widget.state).then((value) {
        setState(() {
          isLoaded = true;
          orders = value;
        });
      });
    } else {
      tripManager.getTripByDriver(widget.state).then((value) {
        setState(() {
          isLoaded = true;
          orders = value;
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width * .95,
        child: Column(
          children: [
            SizedBox(
                height: size.height * .9,
                child: Center(
                  child: isLoaded
                      ? OrdersListView(orders: orders)
                      : const CircularProgressIndicator(),
                )),
            Container(
              width: size.width,
              height: size.height * .1,
              decoration: const BoxDecoration(
                color: TamColors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TamDescButton(
                    label: "جديد",
                    icon: Icons.add,
                    onPressed: () {
                      setState(() {
                        isLoaded = false;
                      });
                      tripManager.getTrip("0").then((value) {
                        setState(() {
                          isLoaded = true;
                          orders = value;
                        });
                      });
                    },
                  ),
                  TamDescButton(
                    label: "حالي",
                    icon: Icons.list,
                    onPressed: () {
                      setState(() {
                        isLoaded = false;
                      });
                      tripManager.getTripByDriver("1").then((value) {
                        setState(() {
                          isLoaded = true;
                          orders = value;
                        });
                      });
                    },
                  ),
                  TamDescButton(
                    label: "الأن",
                    icon: Icons.drive_eta,
                    onPressed: () {
                      setState(() {
                        isLoaded = false;
                      });
                      tripManager.getTripByDriver("2").then((value) {
                        setState(() {
                          isLoaded = true;
                          orders = value;
                        });
                      });
                    },
                  ),
                  TamDescButton(
                    label: "ملغي",
                    icon: Icons.cancel,
                    onPressed: () {
                      setState(() {
                        isLoaded = false;
                      });
                      tripManager.getTripByDriver("3").then((value) {
                        setState(() {
                          isLoaded = true;
                          orders = value;
                        });
                      });
                    },
                  ),
                  TamDescButton(
                    label: "منتهي",
                    icon: Icons.done_all,
                    onPressed: () {
                      setState(() {
                        isLoaded = false;
                      });
                      tripManager.getTripByDriver("4").then((value) {
                        setState(() {
                          isLoaded = true;
                          orders = value;
                        });
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
