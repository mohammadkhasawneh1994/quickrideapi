import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:tam_drive/UI/home.dart';
import 'package:tam_drive/business/manageLocation.dart';
import 'package:tam_drive/business/manageTrip.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/models/post/tripDetails.dart';
import 'package:tam_drive/core/models/views/locationInfo.dart';
import 'package:tam_drive/helpers/sessionManager.dart';

// final _messageStreamController = BehaviorSubject<RemoteMessage>();

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
//   print('Message data: ${message.data}');
//   print('Message notification: ${message.notification?.title}');
//   print('Message notification: ${message.notification?.body}');
// }

class Submit extends StatefulWidget {
  const Submit({super.key});

  @override
  State<Submit> createState() => _SubmitState();
}

class _SubmitState extends State<Submit> {
  Trip trip = Trip();
  TripManager tripManager = TripManager();
  LocationManager locationManager = LocationManager();
  String msg = "تم ارسال طلبك, سيتم اشعارك عند الموافقه عليك من اي من السائقين";

  // _SubmitState() {
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     if (kDebugMode) {
  //       print('Handling a foreground message: ${message.messageId}');
  //       print('Message data: ${message.data}');
  //       print('Message notification: ${message.notification?.title}');
  //       print('Message notification: ${message.notification?.body}');
  //     }

  //     FirebaseMessaging.instance.sendMessage();

  //     setState(() {
  //       msg = message.notification!.title!;
  //     });
  //   });
  // }
  @override
  void initState() {
    ManageSession.getValue(SessionKeys.userId).then((value) {
      trip.client = value!;

      trip.pickup = Location();
      trip.pickup!.lat = TripLocations.startLat;
      trip.pickup!.long = TripLocations.startLang;
      trip.pickup!.locationName = TripLocations.startDesc;

      trip.dropOff = Location();
      trip.dropOff!.lat = TripLocations.endLat;
      trip.dropOff!.long = TripLocations.endLang;
      trip.dropOff!.locationName = TripLocations.endDesc;

      tripManager.addTrip(trip).then((_) {
        locationManager
            .getCarsWithNearest(TripLocations.startLat, TripLocations.startLang)
            .then((_) {
          setState(() {
            msg = "${TripLocations.cars.length} just found!";
          });
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              msg,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
