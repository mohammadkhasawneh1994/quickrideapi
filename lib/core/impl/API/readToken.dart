import 'package:shared_preferences/shared_preferences.dart';
import 'package:tam_drive/core/abstractions/ISessionReader.dart';
import 'package:tam_drive/core/constants/values.dart';

class ReadToken extends ISessionReader<String> {
  @override
  Future<String?> readValue() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(SessionKeys.token)!;
  }
}
