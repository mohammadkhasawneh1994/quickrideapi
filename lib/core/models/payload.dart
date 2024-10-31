class Result {
  int? statusCode;
  bool? isSucess;
  Message? message;
  Object? payload;

  Result({this.statusCode, this.isSucess, this.message, this.payload});

  Result.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isSucess = json['isSucess'];
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
    payload = json['payload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['isSucess'] = isSucess;
    if (message != null) {
      data['message'] = message!.toJson();
    }
    data['payload'] = payload;
    return data;
  }
}

class Message {
  String? text;

  Message({this.text});

  Message.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    return data;
  }
}
