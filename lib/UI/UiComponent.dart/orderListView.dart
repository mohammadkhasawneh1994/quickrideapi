import 'package:flutter/material.dart';
import 'package:tam_drive/UI/orderDetails.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/models/get/order.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class OrdersListView extends StatelessWidget {
  List<Order> orders;
  bool isLoaded = false;
  OrdersListView({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: orders.length,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .15,
                decoration: const BoxDecoration(
                  color: TamColors.violet,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: TamColors.white,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        //width: 130,
                        child: Text(
                      orders[index].userName!,
                      style: const TextStyle(
                          color: TamColors.white, fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      //width: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OrderDetails(
                                        order: orders[index],
                                      ),
                                    ));
                              },
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("تفاصيل"),
                                  Icon(
                                    Icons.info_outline,
                                  )
                                ],
                              )),
                          ElevatedButton(
                              onPressed: () async {
                                await launchUrl(Uri.parse(
                                    "https://www.google.com/maps/dir/?api=1&destination=${orders[index].pickUp!.lat},${orders[index].pickUp!.long}&travelmode=driving"));
                              },
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("الموقع"),
                                  Icon(
                                    Icons.location_on_outlined,
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
