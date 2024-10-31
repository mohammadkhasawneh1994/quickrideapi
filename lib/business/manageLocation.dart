import 'package:tam_drive/core/abstractions/IApiManager.dart';
import 'package:tam_drive/core/constants/enums.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/impl/API/RequestBuilder.dart';
import 'package:tam_drive/core/models/get/carInfo.dart';

class LocationManager extends IApiManager {
  Future getCarsWithNearest(double lat, double long) async {
    String _long = long.toString();
    String _lat = lat.toString();
    requestBuilder = RequestBuilder();
    requestBuilder.dir =
        Car.nearest.replaceAll("{longt}", _long).replaceAll("{lat}", _lat);
    var req = await requestBuilder.build(RequestType.get);
    res = await req.load();
    if (res.isSucess!) {
      var data = res.payload as List;
      //var carJson = json.decode(data) as List;
      TripLocations.cars = data.map((i) => CarInfo.fromJson(i)).toList();
    }
  }
}
