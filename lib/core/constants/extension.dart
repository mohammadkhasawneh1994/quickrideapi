import 'dart:io';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:tam_drive/UI/login.dart';
import 'package:tam_drive/core/abstractions/IApiManager.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/models/payload.dart';
import 'package:flutter/material.dart';
import 'package:tam_drive/UI/signup.dart';
import 'package:tam_drive/UI/error.dart';
import 'package:tam_drive/core/models/views/distance.dart';

extension ToIfElse on Result {
  void replaceIfElse(BuildContext context, Widget success, Widget failure) {
    if (isSucess!) {
      if (statusCode == HttpStatus.ok) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => success,
          ),
        );
      }
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => failure, //torefresh
        ),
      );
    }
  }

  void pushIfElse(BuildContext context, Widget success, Widget failure) {
    if (isSucess!) {
      if (statusCode == HttpStatus.ok) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => success,
          ),
        );
      }
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => failure, //torefresh
        ),
      );
    }
  }
}

extension ToSpecificWidget on Result {
  void replaceSpecific(BuildContext context, Widget widget) {
    if (isSucess!) {
      if (statusCode == HttpStatus.ok) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => widget,
          ),
        );
      }
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Error(result: this), //torefresh
        ),
      );
    }
  }

  void pushSpecific(BuildContext context, Widget widget) {
    if (isSucess!) {
      if (statusCode == HttpStatus.ok) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => widget,
          ),
        );
      }
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Error(result: this), //torefresh
        ),
      );
    }
  }
}

extension ToDefinedWidget on Result {
  void replace(BuildContext context) {
    if (!isSucess!) {
      if (statusCode == HttpStatus.notFound) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const SignUp(),
          ),
        );
      } else if (statusCode == HttpStatus.unauthorized) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Error(result: this), //torefresh
          ),
        );
      }
    }
  }

  void push(BuildContext context) {
    if (!isSucess!) {
      if (statusCode == HttpStatus.forbidden) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SignUp(),
          ),
        );
      } else if (statusCode == HttpStatus.unauthorized) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Error(result: this), //torefresh
          ),
        );
      }
    }
  }
}

extension NumberParsing on String? {
  bool isNullOrEmpty() {
    if (this == null || this == "") {
      return true;
    }
    return false;
  }
}

extension SetExceptionResult on IApiManager {
  Result setErrorResult(String ex) {
    return Result(
        message: Message(text: ex),
        payload: null,
        isSucess: false,
        statusCode: 500);
  }
}

extension SetPoint on PlacesSearchResult {
  void setPoint({bool isStart = true}) {
    if (isStart) {
      TripLocations.startLang = geometry!.location.lng;
      TripLocations.startLat = geometry!.location.lat;
      TripLocations.startDesc = name;
    } else {
      TripLocations.endLang = geometry!.location.lng;
      TripLocations.endLat = geometry!.location.lat;
      TripLocations.endDesc = name;
    }
  }
}

extension SetPrice on Distance {
  double setPrice({bool isStart = true}) {
    if (km >= 0 && km < 2.8) return km * .75;
    if (km >= 2.8 && km < 11) return km * .27;
    if (km >= 11 && km < 50) return km * .23;
    if (km >= 50) return km * .18;
    return .75;
  }
}
