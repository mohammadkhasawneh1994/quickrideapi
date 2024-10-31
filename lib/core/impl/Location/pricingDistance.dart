import 'package:flutter_google_maps_webservices/distance.dart';
import 'package:tam_drive/core/abstractions/ILocationService.dart';
import 'package:tam_drive/core/models/get/order.dart';

class PricingTrip extends WithValue<Order, List<Row>> {
  @override
  Future<List<Row>> main(Order order) async {
    final distanceMatrix =
        GoogleDistanceMatrix(apiKey: 'AIzaSyAQq4-M_5Mo6SF0LkvG0ZAxN1VidBqPx8E');
    var origins = [Location(lat: order.pickUp!.lat!, lng: order.pickUp!.long!)];
    var destinations = [
      Location(lat: order.dropOff!.lat!, lng: order.dropOff!.long!)
    ];

    var responseForLocation = await distanceMatrix.distanceWithLocation(
      origins,
      destinations,
    );

    if (responseForLocation.isOkay) {
      return responseForLocation.rows;
    } else {
      return List<Row>.empty();
    }
  }
}
