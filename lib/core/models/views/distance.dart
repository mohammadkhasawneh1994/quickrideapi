import 'package:tam_drive/core/constants/extension.dart';

class Distance {
  Distance({required this.km});
  double km = 0.0;
  double get price {
    return setPrice() / 10;
  }
}
