import 'package:location/location.dart';
import 'package:tam_drive/core/abstractions/IPermissionHandler.dart';

class HandleLocationPermission extends IPermissionHandler<Location> {
  HandleLocationPermission(super.location);

  @override
  Future<bool> handlePermission() async {
    PermissionStatus permissionGranted;

    permissionGranted = await value.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await value.requestPermission();
    }

    if (permissionGranted == PermissionStatus.granted) {
      return true;
    }

    return false;
  }
}
