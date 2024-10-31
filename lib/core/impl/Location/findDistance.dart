import 'dart:async';
import 'package:flutter_google_maps_webservices/distance.dart';
import 'package:tam_drive/core/abstractions/ILocationService.dart';
import 'package:tam_drive/core/constants/values.dart';

class FindDistance implements ILocationService<List<Row>> {
  @override
  Future<List<Row>> main() async {
    final distanceMatrix =
        GoogleDistanceMatrix(apiKey: 'AIzaSyAQq4-M_5Mo6SF0LkvG0ZAxN1VidBqPx8E');
    var origins = [
      Location(lat: TripLocations.startLat, lng: TripLocations.startLang)
    ];
    var destinations = [
      Location(lat: TripLocations.endLat, lng: TripLocations.endLang)
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
