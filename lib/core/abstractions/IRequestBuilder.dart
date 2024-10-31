import 'package:http/http.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/constants/enums.dart';
import 'package:tam_drive/core/models/payload.dart';

abstract class IRequestBuilder {
  String url = Endpoints.address;
  late String dir;
  Map<String, String> headers = <String, String>{};
  late Object payload;

  late Future<Response> response;

  Future<IRequestBuilder> build(RequestType type);
  Future<Result> load();
  IRequestBuilder addHeader(String key, String value);
}
