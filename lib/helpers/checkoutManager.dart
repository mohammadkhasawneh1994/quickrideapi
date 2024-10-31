import 'package:flutter_google_maps_webservices/distance.dart';
import 'package:tam_drive/core/abstractions/ILocationService.dart';
import 'package:tam_drive/core/impl/Location/findDistance.dart';
import 'package:tam_drive/core/impl/Location/pricingDistance.dart';
import 'package:tam_drive/core/models/get/order.dart';
import 'package:tam_drive/core/models/views/distance.dart';

class ManageCheckout {
  Future<Distance> checkout() async {
    ILocationService<List<Row>> findDistance = FindDistance();
    var result = await findDistance.main();
    var dis =
        double.parse(result[0].elements[0].distance.text.replaceAll(" km", ""));
    return Distance(km: dis);
  }

  Future<Distance> checkoutByOrder(Order order) async {
    WithValue<Order, List<Row>> findDistance = PricingTrip();
    var result = await findDistance.main(order);
    var dis =
        double.parse(result[0].elements[0].distance.text.replaceAll(" km", ""));
    return Distance(km: dis);
  }
}
