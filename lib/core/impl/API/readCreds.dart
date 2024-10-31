import 'package:shared_preferences/shared_preferences.dart';
import 'package:tam_drive/core/abstractions/ISessionReader.dart';
import 'package:tam_drive/core/constants/extension.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/models/post/userLogin.dart';

class readCreds extends ISessionReader<userLogin> {
  @override
  Future<userLogin?> readValue() async {
    prefs = await SharedPreferences.getInstance();
    var val = prefs.getString(SessionKeys.cred);

    if (!val.isNullOrEmpty()) {
      var creds = val!.split(',');
      if (creds.isNotEmpty) {
        return userLogin(mobile: creds[0], password: creds[1]);
      }
    }

    return null;
  }
}
