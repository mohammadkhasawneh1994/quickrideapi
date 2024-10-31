class userSignup {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;

  userSignup(
      {this.firstName, this.lastName, this.email, this.password, this.phone});

  userSignup.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    return data;
  }
}
