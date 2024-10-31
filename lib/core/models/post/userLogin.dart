class userLogin {
  String? mobile;
  String? password;

  userLogin({this.mobile, this.password});

  userLogin.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = mobile;
    data['password'] = password;
    return data;
  }
}
