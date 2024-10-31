import 'package:flutter/material.dart';
import 'package:tam_drive/UI/UiComponent.dart/Button.dart';
import 'package:tam_drive/UI/UiComponent.dart/TextField.dart';
import 'package:tam_drive/UI/UiComponent.dart/checkbox.dart';
import 'package:tam_drive/UI/driver.dart';
import 'package:tam_drive/UI/home.dart';
import 'package:tam_drive/UI/signup.dart';
import 'package:tam_drive/business/manageUser.dart';
import 'package:tam_drive/core/constants/extension.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/models/post/userLogin.dart';
import 'package:tam_drive/helpers/sessionManager.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool? checkBoxValue = false;
  bool isLoggedIn = true;
  userLogin login = userLogin();
  UserManager authManager = UserManager();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: SizedBox(
                width: size.width * .45,
                height: size.height * .2,
                child: Image.asset("assets/images/q_6.png"),
              ),
            ),
            SizedBox(
              width: size.width * .95,
              height: size.height * .35,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TamTaxtField(
                        inputType: TextInputType.number,
                        isSecured: false,
                        label: "رقم الهاتف",
                        width: .625,
                        onChanged: (String v) {
                          setState(() {
                            login.mobile = "0$v";
                          });
                        },
                      ),
                      TamTaxtField(
                        isSecured: false,
                        isReadOnly: true,
                        label: "00962",
                        width: .205,
                        onChanged: (String v) {},
                      ),
                    ],
                  ),
                  TamTaxtField(
                    isSecured: true,
                    label: "كلمة السر",
                    width: .85,
                    onChanged: (String v) {
                      setState(() {
                        login.password = v;
                      });
                    },
                  ),
                  TamCheckBox(
                      dafaultValue: checkBoxValue,
                      onChanged: (bool? newValue) {
                        setState(() {
                          checkBoxValue = newValue;
                          if (newValue!) {
                            ManageSession.setValue(SessionKeys.cred,
                                "${login.mobile},${login.password}");
                          } else {
                            ManageSession.setValue(SessionKeys.cred, "");
                          }
                        });
                      },
                      label: "تذكرني!",
                      width: 0.85),
                ],
              ),
            ),
            TamButton(
                onPressed: () {
                  setState(() {
                    isLoggedIn = false;
                  });
                  authManager.login(login).then((value) {
                    ManageSession.getValue(SessionKeys.role).then((role) {
                      if (role == "Driver") {
                        authManager.res.replaceIfElse(
                            context, const Driver(), const Login());
                      } else {
                        authManager.res.replaceIfElse(
                            context, const Home(), const Login());
                      }
                    });
                  });
                },
                label: isLoggedIn ? "دخول" : "يرجى الأنتظار...",
                width: 0.85),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("لا تمتلك حساب؟"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: const Text("سجل الأن"))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
