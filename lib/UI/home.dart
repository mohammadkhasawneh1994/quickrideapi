import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tam_drive/UI/map.dart';
import 'package:tam_drive/UI/profile.dart';
import 'package:tam_drive/UI/searchMap.dart';
import 'package:tam_drive/UI/submitTrip.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/helpers/checkoutManager.dart';
import 'package:tam_drive/helpers/locationManager.dart';
import 'package:tam_drive/helpers/sessionManager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isMarksLoaded = false;
  ManageCheckout manageCheckout = ManageCheckout();
  var getLocation = ManageLocation();
  double dis = 0.0, price = 0.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String username = "";

  @override
  void initState() {
    ManageSession.getValue(SessionKeys.name).then((value) {
      setState(() {
        username = value!;
      });
    });
    setState(() {
      TripLocations.markers["pick-up"] = Marker(
        markerId: const MarkerId("pick-up"),
        position: LatLng(TripLocations.startLat, TripLocations.startLang),
        draggable: true,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        onDragEnd: (value) {
          setState(() {
            TripLocations.startLat = value.latitude;
            TripLocations.startLang = value.longitude;
            TripLocations.startDesc = "تحديد حسب النقطة";
          });
        },
      );
    });

    if (TripLocations.isThereAEnd) {
      TripLocations.markers["drop-off"] = Marker(
        markerId: const MarkerId("drop-off"),
        position: LatLng(TripLocations.endLat, TripLocations.endLang),
        draggable: true,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onDragEnd: (value) {
          setState(() {
            TripLocations.endLat = value.latitude;
            TripLocations.endLang = value.longitude;
            TripLocations.endDesc = "تحديد حسب النقطة";
          });
        },
      );

      manageCheckout.checkout().then((value) {
        setState(() {
          dis = value.km;
          price = value.price;
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        //drawer: const Profile(),
        endDrawer: Profile(username: username),
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
                    width: size.width,
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
                          height: size.height * .3,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              SizedBox(
                                width: size.width,
                                height: size.height * .1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "  ${TripLocations.startDesc}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: TamColors.violet,
                                        fontSize: 15,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      const SearchMap()));
                                        },
                                        color: TamColors.violet,
                                        iconSize: 30,
                                        icon: const Icon(
                                            Icons.chevron_right_sharp))
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width,
                                height: size.height * .1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "  ${TripLocations.endDesc}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: TamColors.violet,
                                        fontSize: 15,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      const SearchMap(
                                                        isStart: false,
                                                      )));
                                        },
                                        color: TamColors.violet,
                                        iconSize: 30,
                                        icon: const Icon(
                                            Icons.chevron_right_sharp))
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width,
                                height: size.height * .1,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (TripLocations.isThereAEnd &&
                                        TripLocations.isThereAStart) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext builder) =>
                                                  const Submit()));
                                    }
                                  },
                                  style: ButtonStyle(
                                      shape: WidgetStateProperty.all<
                                              RoundedRectangleBorder>(
                                          const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      )),
                                      backgroundColor:
                                          WidgetStateProperty.all<Color>(
                                              TripLocations.isThereAEnd &&
                                                      TripLocations
                                                          .isThereAStart
                                                  ? TamColors.violet
                                                  : Colors.grey),
                                      foregroundColor:
                                          WidgetStateProperty.all<Color>(
                                              TamColors.white)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("$dis كم /  $price دا"),
                                      const Icon(Icons.check)
                                    ],
                                  ),
                                ),
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: [
                              //     Container(
                              //       decoration: BoxDecoration(
                              //           color: TripLocations.isThereAStart
                              //               ? const Color(0xff7C4DA6)
                              //               : Colors.grey,
                              //           borderRadius: const BorderRadius.all(
                              //               Radius.circular(50))),
                              //       child: IconButton(
                              //         onPressed: () {
                              //           if (TripLocations.isThereAStart) {
                              //             Navigator.of(context).push(
                              //                 MaterialPageRoute(
                              //                     builder:
                              //                         (BuildContext builder) =>
                              //                             const DropOff()));
                              //           }
                              //         },
                              //         icon: const Icon(Icons.chevron_right_sharp),
                              //         color: Colors.white,
                              //       ),
                              //     )
                              //   ],
                              // ),
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
