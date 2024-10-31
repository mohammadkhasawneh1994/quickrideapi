import 'package:shared_preferences/shared_preferences.dart';

class ManageSession {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static Future setValue(String key, String value) async {
    var prefs = await _prefs;
    prefs.setString(key, value);
  }

  static Future<String?> getValue(String key) async {
    var prefs = await _prefs;
    return prefs.getString(key);
  }
}
