import 'package:flutter/material.dart';
import 'package:tam_drive/UI/orderDetails.dart';
import 'package:tam_drive/business/manageTrip.dart';
import 'package:tam_drive/core/models/get/order.dart';

class Orders extends StatefulWidget {
  final String state;
  const Orders({super.key, required this.state});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  TripManager tripManager = TripManager();
  List<Order> orders = [];
  bool isLoaded = false;
  @override
  void initState() {
    tripManager.getTrip(widget.state).then((value) {
      setState(() {
        isLoaded = true;
        orders = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.blue,
        onRefresh: () async {
          setState(() {
            isLoaded = false;
          });
          tripManager.getTrip(widget.state).then((value) {
            setState(() {
              isLoaded = true;
              orders = value;
            });
          });
        },
        child: Center(
          child: isLoaded
              ? ListView.builder(
                  itemCount: orders.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderDetails(
                                  order: orders[index],
                                ),
                              ));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .9,
                          height: MediaQuery.of(context).size.height * .1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(orders[index].userName!),
                              const Icon(
                                Icons.chevron_right,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
