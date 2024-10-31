import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tam_drive/core/constants/values.dart';

// ignore: must_be_immutable
class Map extends StatefulWidget {
  List<Marker> markers = [];
  Map({super.key, required this.markers});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  bool isOpen = false;
  double lat = 0.0, lang = 0.0;

  @override
  Widget build(BuildContext context) {
    CameraPosition currentPosition = CameraPosition(
      target: LatLng(TripLocations.startLat, TripLocations.startLang),
      zoom: 9.8746,
    );
    return SizedBox(
      child: widget.markers.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: TamColors.violet,
              ),
            )
          : GoogleMap(
              mapType: MapType.satellite,
              initialCameraPosition: currentPosition,
              markers: widget.markers.toSet(),
            ),
    );
  }
}
