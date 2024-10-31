import 'package:tam_drive/core/abstractions/ILocationService.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/impl/Location/findCurrentLocation.dart';
import 'package:tam_drive/core/models/views/position.dart';

class ManageLocation {
  Future setTripLocation() async {
    ILocationService<Position> findLocation = GetLocation();
    if (!TripLocations.isThereAStart) {
      var position = await findLocation.main();

      TripLocations.startLang = position.lang;
      TripLocations.startLat = position.lat;
      // TripLocations.endLang = position.lang;
      // TripLocations.endLat = position.lat;
    }
  }

  Future setDriverLocation() async {
    ILocationService<Position> findLocation = GetLocation();

    var position = await findLocation.main();

    TripLocations.driverLang = position.lang;
    TripLocations.driverLat = position.lat;
  }
}
