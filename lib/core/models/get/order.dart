import 'package:tam_drive/core/models/views/locationInfo.dart';

class Order {
  String? id;
  String? userId;
  int? state;
  String? userName;
  String? date;
  Location? pickUp;
  Location? dropOff;

  Order({this.id, this.userId, this.userName, this.pickUp, this.dropOff});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    state = json['state'];
    userName = json['userName'];
    date = json['date'];
    pickUp = json['pickUp'] != null ? Location.fromJson(json['pickUp']) : null;
    dropOff =
        json['dropOff'] != null ? Location.fromJson(json['dropOff']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['state'] = state;
    data['userName'] = userName;
    data['date'] = date;
    if (pickUp != null) {
      data['pickUp'] = pickUp!.toJson();
    }
    if (dropOff != null) {
      data['dropOff'] = dropOff!.toJson();
    }
    return data;
  }
}

class PickUp {
  double? lat;
  double? long;

  PickUp({this.lat, this.long});

  PickUp.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['lat'] = lat;
    data['long'] = long;
    return data;
  }
}
