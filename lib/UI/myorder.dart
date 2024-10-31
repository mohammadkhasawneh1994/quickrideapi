import 'package:flutter/material.dart';
import 'package:tam_drive/business/manageTrip.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/models/get/order.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  List<Order> orders = [];
  TripManager tripManager = TripManager();

  @override
  void initState() {
    tripManager.getTripByUser("5").then((value) {
      setState(() {
        orders = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: size.width * .9,
                height: size.height * .15,
                child: const Center(
                  child: Text(
                    "رحلاتي",
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * .9,
                height: size.height * .85,
                child: ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: size.width * .9,
                        height: size.height * .12,
                        padding: const EdgeInsets.only(right: 15),
                        decoration: const BoxDecoration(
                            color: TamColors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 15)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: size.width * .5,
                              height: size.height * .1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    orders[index].date!,
                                    style: const TextStyle(fontSize: 9),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: TamColors.violet,
                                      ),
                                      Text(
                                        " ${orders[index].pickUp!.locationName!}",
                                        style: const TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: Color(0xFF1F53AC),
                                      ),
                                      Text(
                                        " ${orders[index].dropOff!.locationName!}",
                                        style: const TextStyle(fontSize: 15),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width * .3,
                              height: size.height * .1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.info,
                                        color: Color(0xFFA19204),
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
