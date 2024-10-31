import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tam_drive/UI/landing.dart';
import 'package:tam_drive/firebase_options.dart';

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
//   print('Message data: ${message.data}');
//   print('Message notification: ${message.notification?.title}');
//   print('Message notification: ${message.notification?.body}');
// }

Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   final messaging = FirebaseMessaging.instance;

//   await messaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );

//   String? token = await messaging.getToken();

//   if (kDebugMode) {
//     print('Registration Token=$token');
//   }

//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFBF4FF)),
      home: const MaterialApp(
        home: Landing(),
      )));
}
