import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tam_drive/UI/map.dart';
import 'package:tam_drive/UI/profileDriver.dart';
import 'package:tam_drive/business/manageTrip.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/models/put/updateCar.dart';
import 'package:tam_drive/core/models/views/locationInfo.dart';
import 'package:tam_drive/helpers/locationManager.dart';
import 'package:tam_drive/helpers/sessionManager.dart';

class Driver extends StatefulWidget {
  const Driver({super.key});

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  var getLocation = ManageLocation();
  TripManager tripManager = TripManager();
  double dis = 0.0, price = 0.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String username = "";
  bool isSwitched = false;
  var textValue = 'طلب';

  void toggleSwitch(bool value) {
    var updateCar = UpdateCar();
    updateCar.rideType = value ? 1 : 0;
    updateCar.location = Location();
    updateCar.location!.lat = TripLocations.driverLat;
    updateCar.location!.long = TripLocations.driverLang;
    updateCar.location!.locationName = TripLocations.driverDesc;
    tripManager.updateDriverState(updateCar).then((value) {
      if (isSwitched == false) {
        setState(() {
          isSwitched = true;
          textValue = 'راكب';
        });
      } else {
        setState(() {
          isSwitched = false;
          textValue = 'طلب';
        });
      }
    });
  }

  @override
  void initState() {
    ManageSession.getValue(SessionKeys.name).then((value) {
      setState(() {
        username = value!;
      });
    });

    getLocation.setDriverLocation().then((mrkrs) {
      setState(() {
        TripLocations.markers["driver-location"] = Marker(
          markerId: const MarkerId("driver-location"),
          position: LatLng(TripLocations.driverLat, TripLocations.driverLang),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        );
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        //drawer: const Profile(),
        endDrawer: ProfileDriver(username: username),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Stack(
              children: [
                Map(
                  markers: TripLocations.markers.values.toList(),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: size.width * .9,
                    height: size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.width,
                          height: size.height * .1,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () => _scaffoldKey.currentState
                                          ?.openEndDrawer(),
                                      color: TamColors.white,
                                      style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all<Color>(
                                                  TamColors.violet)),
                                      icon: const Icon(Icons.person_2_sharp)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(username),
                                      const Text("0.00")
                                    ],
                                  )
                                ],
                              ),
                              // IconButton(
                              //     onPressed: () =>
                              //         _scaffoldKey.currentState?.openDrawer(),
                              //     color: TamColors.violet,
                              //     icon: const Icon(Icons.notifications)),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width,
                          height: size.height * .1,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              SizedBox(
                                width: size.width * .7,
                                height: size.height * .1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "  $textValue",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: TamColors.violet,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Switch(
                                      onChanged: toggleSwitch,
                                      value: isSwitched,
                                      activeColor: TamColors.violet,
                                      activeTrackColor: TamColors.white,
                                      inactiveThumbColor: TamColors.white,
                                      inactiveTrackColor: TamColors.violet,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
