class Token {
  String? token;
  String? id;
  String? role;
  String? fullname;

  Token({this.token, this.id});

  Token.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    role = json['role'];
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['id'] = id;
    data['role'] = role;
    data['fullname'] = fullname;
    return data;
  }
}
