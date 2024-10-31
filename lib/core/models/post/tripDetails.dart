import 'package:tam_drive/core/models/views/locationInfo.dart';

class Trip {
  Location? pickup;
  Location? dropOff;
  String? client;

  Trip({this.pickup, this.dropOff, this.client});

  Trip.fromJson(Map<String, dynamic> json) {
    pickup = json['pickup'] != null ? Location.fromJson(json['pickup']) : null;
    dropOff =
        json['dropOff'] != null ? Location.fromJson(json['dropOff']) : null;
    client = json['client'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pickup != null) {
      data['pickup'] = pickup!.toJson();
    }
    if (dropOff != null) {
      data['dropOff'] = dropOff!.toJson();
    }
    data['client'] = client;

    return data;
  }
}
