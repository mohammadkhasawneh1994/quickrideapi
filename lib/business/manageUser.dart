import 'package:tam_drive/core/abstractions/IApiManager.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/constants/enums.dart';
import 'package:tam_drive/core/impl/API/RequestBuilder.dart';
import 'package:tam_drive/core/models/get/token.dart';
import 'package:tam_drive/core/models/post/userLogin.dart';
import 'package:tam_drive/core/models/post/userSignup.dart';
import 'package:tam_drive/helpers/sessionManager.dart';

class UserManager extends IApiManager {
  Future login(userLogin login) async {
    requestBuilder = RequestBuilder();
    requestBuilder.dir = Auth.login;
    requestBuilder.payload = login;
    var req = await requestBuilder.build(RequestType.post);
    res = await req.load();
    if (res.isSucess!) {
      var user = res.payload! as Map<String, dynamic>;
      var info = Token.fromJson(user);
      await ManageSession.setValue(SessionKeys.token, info.token!);
      await ManageSession.setValue(SessionKeys.userId, info.id!);
      await ManageSession.setValue(SessionKeys.role, info.role!);
      await ManageSession.setValue(SessionKeys.name, info.fullname!);
    }
  }

  Future signup(userSignup signup) async {
    requestBuilder = RequestBuilder();
    requestBuilder.dir = Auth.signup;
    requestBuilder.payload = signup;
    var req = await requestBuilder.build(RequestType.post);
    res = await req.load();
  }
}
