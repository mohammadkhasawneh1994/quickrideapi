import 'dart:async';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:tam_drive/core/abstractions/ILocationService.dart';

class FindLocationByName
    implements WithValue<String, List<PlacesSearchResult>> {
  final places = GoogleMapsPlaces(
    apiKey: 'AIzaSyAQq4-M_5Mo6SF0LkvG0ZAxN1VidBqPx8E',
  );

  @override
  Future<List<PlacesSearchResult>> main(String value) async {
    var res = await places.searchByText(value);

    if (res.isOkay) {
      return res.results;
    } else {
      return List<PlacesSearchResult>.empty();
    }
  }
}
