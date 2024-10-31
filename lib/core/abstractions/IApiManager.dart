import 'package:tam_drive/core/abstractions/IRequestBuilder.dart';
import 'package:tam_drive/core/models/payload.dart';

abstract class IApiManager {
  late IRequestBuilder requestBuilder;
  late Result res;
}
