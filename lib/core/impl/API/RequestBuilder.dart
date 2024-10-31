import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tam_drive/core/abstractions/IRequestBuilder.dart';
import 'package:tam_drive/core/constants/enums.dart';
import 'package:tam_drive/core/constants/extension.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/models/payload.dart';
import 'package:tam_drive/helpers/sessionManager.dart';

class RequestBuilder extends IRequestBuilder {
  @override
  Future<IRequestBuilder> build(RequestType type) async {
    await _buildHeader();

    Uri uri = Uri.parse("$url$dir");

    switch (type) {
      case RequestType.get:
        response = http.get(uri, headers: headers);
      case RequestType.post:
        payload = json.encode(payload);
        response = http.post(uri, headers: headers, body: payload);
      case RequestType.put:
        payload = json.encode(payload);
        response = http.put(uri, headers: headers, body: payload);
      case RequestType.delete:
        response = http.delete(uri, headers: headers);
      case RequestType.head:
        response = http.head(uri, headers: headers);
    }

    return this;
  }

  @override
  Future<Result> load() async {
    var res = await response;

    Map<String, dynamic> returned = json.decode(res.body);
    Result payload = Result.fromJson(returned);
    return payload;
  }

  Future _buildHeader() async {
    headers["Content-Type"] = "application/json";
    var token = await ManageSession.getValue(SessionKeys.token);
    headers["Authorization"] = "Basic MTExOTkxNjc6NjAtZGF5ZnJlZXRyaWFs";
    if (token.isNullOrEmpty()) {
      //headers["Authorization"] = "Basic MTExODk4MDg6NjAtZGF5ZnJlZXRyaWFs";
      //headers["Authorization"] = "Bearer $token";
    }
  }

  @override
  IRequestBuilder addHeader(String key, String value) {
    headers[key] = value;
    return this;
  }
}
