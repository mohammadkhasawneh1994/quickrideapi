import 'package:shared_preferences/shared_preferences.dart';

abstract class ISessionReader<T> {
  late SharedPreferences prefs;
  Future<T?> readValue();
}
