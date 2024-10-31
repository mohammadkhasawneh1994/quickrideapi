class Position {
  double lang = 0.0;
  double lat = 0.0;
  bool state = false;
  String message = "";

  Position(
      {required this.lat,
      required this.lang,
      required this.state,
      required this.message});
}
