import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tam_drive/core/models/get/carInfo.dart';

class SessionKeys {
  static const String token = "token";
  static const String userId = "id";
  static const String cred = "creds";
  static const String role = "role";
  static const String name = "name";
}

class Endpoints {
  static const String address = "http://api.quickride.net/v1/";
}

class Auth {
  static const String signup = "Auth";
  static const String login = "Auth/login/byuser";
}

class Tour {
  //It's Trip
  static const String add = "Trip";
  static const String query = "Trip/{state}";
  static const String byuser = "Trip/byuser/{state}/Id/{Id}";
  static const String bydriver = "Trip/bydriver/{state}/Id/{Id}";
  static const String confirmed = "Trip/confrimed/{Id}";
  static const String arrived = "Trip/arrived/{Id}";
  static const String cancelled = "Trip/cancelled/{Id}";
  static const String finished = "Trip/finished/{Id}";
}

class Car {
  //It's Trip
  static const String newride = "Car/newride/{Id}";
  static const String nearest = "Car/nearest/{longt}/{lat}";
}

class TripLocations {
  static double startLang = 0.0;
  static double startLat = 0.0;
  static String startDesc = "موقعي الحالي";

  static double endLang = 0.0;
  static double endLat = 0.0;
  static String endDesc = "الذهاب الى";

  static double driverLang = 0.0;
  static double driverLat = 0.0;
  static String driverDesc = "DriverLocation";

  static Map<String, Marker> markers = {};

  static bool get isThereAStart {
    return startLang > 0.0 || TripLocations.startLat > 0.0;
  }

  static bool get isThereAEnd {
    return endLang > 0.0 || TripLocations.endLat > 0.0;
  }

  // static bool get isThereAPosition {
  //   return TripLocations.startLat != TripLocations.endLat &&
  //       TripLocations.startLang != TripLocations.endLang;
  // }

  static void setStart(double lat, double lng, String desc,
      {bool isStart = true}) {
    if (isStart) {}
  }

  static List<CarInfo> cars = List.empty();
}

class TamColors {
  static const Color white = Color(0xFFFAFAFA);
  static const Color violet = Color(0xFF7C4DA6);
}
