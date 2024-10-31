import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tam_drive/UI/UiComponent.dart/confirmation.dart';
import 'package:tam_drive/UI/UiComponent.dart/finalization.dart';
import 'package:tam_drive/UI/UiComponent.dart/pricing.dart';
import 'package:tam_drive/UI/UiComponent.dart/varification.dart';
import 'package:tam_drive/business/manageTrip.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/models/get/order.dart';
import 'package:tam_drive/UI/map.dart';

// ignore: must_be_immutable
class OrderDetails extends StatefulWidget {
  final Order order;
  OrderDetails({super.key, required this.order});
  Widget row = Text("");

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  TripManager tripManager = TripManager();

  @override
  void initState() {
    if (widget.order.state == 0) {
      setState(() {
        widget.row = Cofirmation(
          order: widget.order,
        );
      });
    } else if (widget.order.state == 1) {
      setState(() {
        widget.row = Varification(
          order: widget.order,
        );
      });
    } else if (widget.order.state == 2) {
      setState(() {
        widget.row = Finalization(
          order: widget.order,
        );
      });
    } else if (widget.order.state == 4) {
      setState(() {
        widget.row = Pricing(
          order: widget.order,
        );
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Map(
            markers: [
              Marker(
                  markerId: const MarkerId("client-id"),
                  position: LatLng(
                      widget.order.pickUp!.lat!, widget.order.pickUp!.long!),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue))
            ],
          ),
          Center(
            child: SizedBox(
              width: size.width * .95,
              height: size.height * .95,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * .9,
                    height: size.height * .1,
                    decoration: const BoxDecoration(
                        color: TamColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Text(
                        widget.order.userName!,
                        style: const TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    child: widget.row,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
