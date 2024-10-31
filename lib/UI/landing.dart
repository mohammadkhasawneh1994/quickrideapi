import 'package:flutter/material.dart';
import 'package:tam_drive/UI/driver.dart';
import 'package:tam_drive/UI/home.dart';
import 'package:tam_drive/UI/login.dart';
import 'package:tam_drive/business/manageUser.dart';
import 'package:tam_drive/core/constants/extension.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/impl/API/readCreds.dart';
import 'package:tam_drive/core/models/post/userLogin.dart';
import 'package:tam_drive/helpers/locationManager.dart';
import 'package:tam_drive/helpers/sessionManager.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  UserManager authManager = UserManager();
  var getLocation = ManageLocation();
  late userLogin login;
  // GetLocation getLocation = GetLocation();
  bool isDone = false;

  @override
  void initState() {
    super.initState();

    getLocation.setTripLocation().then((mrkrs) {
      readCreds().readValue().then((creds) {
        if (creds != null) {
          authManager.login(creds).then((value) {
            setState(() {
              isDone = true;
            });

            ManageSession.getValue(SessionKeys.role).then((value) {
              if (value == "Driver") {
                authManager.res
                    .replaceIfElse(context, const Driver(), const Login());
              } else {
                authManager.res
                    .replaceIfElse(context, const Home(), const Login());
              }
            });
          });
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        top: true,
        child: Container(
          width: width,
          height: height * 1,
          decoration: const BoxDecoration(
            color: TamColors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * .4,
                height: height * .2,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/q_5.png',
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: height * .2,
                child: const Text(
                  "Quick, Faster than wick, arrive in wink!",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                child: !isDone
                    ? const CircularProgressIndicator(
                        color: TamColors.violet,
                      )
                    : const Text("done loading"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
