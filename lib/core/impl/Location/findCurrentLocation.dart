import 'package:location/location.dart';
import 'package:tam_drive/core/abstractions/ILocationService.dart';
import 'package:tam_drive/core/impl/Permission/handleLocationPermission.dart';
import 'package:tam_drive/core/models/views/position.dart';

class GetLocation implements ILocationService<Position> {
  @override
  Future<Position> main() async {
    Location location = Location();
    HandleLocationPermission locationPermission =
        HandleLocationPermission(location);
    try {
      bool serviceEnabled;
      bool isPermissioned = await locationPermission.handlePermission();
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
      }
      if (serviceEnabled && isPermissioned) {
        LocationData currentPosition = await location.getLocation();
        return Position(
            lat: currentPosition.latitude!,
            lang: currentPosition.longitude!,
            message: "gotten",
            state: true);
      } else {
        throw Exception("No Permission Provided!");
      }
    } catch (e) {
      return Position(lat: 0.0, lang: 0.0, message: e.toString(), state: false);
    }
  }
}
