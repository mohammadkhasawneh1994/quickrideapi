import 'package:tam_drive/core/models/views/locationInfo.dart';

class CarInfo {
  String? id;
  String? driverId;
  String? driverName;
  String? brand;
  String? class_;
  int? year;
  String? color;
  int? code;
  int? number;
  Location? location;

  CarInfo(
      {this.id,
      this.driverId,
      this.driverName,
      this.brand,
      this.class_,
      this.year,
      this.color,
      this.code,
      this.number,
      this.location});

  CarInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverId = json['driverId'];
    driverName = json['driverName'];
    brand = json['brand'];
    class_ = json['class'];
    year = json['year'];
    color = json['color'];
    code = json['code'];
    number = json['number'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['driverId'] = driverId;
    data['driverName'] = driverName;
    data['brand'] = brand;
    data['class'] = class_;
    data['year'] = year;
    data['color'] = color;
    data['code'] = code;
    data['number'] = number;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}
