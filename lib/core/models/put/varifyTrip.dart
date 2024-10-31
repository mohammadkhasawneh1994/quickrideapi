class VarifyTrip {
  Code? code;

  VarifyTrip({this.code});

  VarifyTrip.fromJson(Map<String, dynamic> json) {
    code = json['code'] != null ? Code.fromJson(json['code']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (code != null) {
      data['code'] = code!.toJson();
    }
    return data;
  }
}

class Code {
  String? data;

  Code({this.data});

  Code.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    return data;
  }
}
