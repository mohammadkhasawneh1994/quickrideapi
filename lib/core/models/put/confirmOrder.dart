class ConfirmTrip {
  String? driver;

  ConfirmTrip({this.driver});

  ConfirmTrip.fromJson(Map<String, dynamic> json) {
    driver = json['driver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['driver'] = driver;
    return data;
  }
}
