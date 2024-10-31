import 'package:tam_drive/core/models/views/locationInfo.dart';

class UpdateCar {
  int? rideType;
  Location? location;

  UpdateCar({this.rideType, this.location});

  UpdateCar.fromJson(Map<String, dynamic> json) {
    rideType = json['rideType'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rideType'] = rideType;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}
