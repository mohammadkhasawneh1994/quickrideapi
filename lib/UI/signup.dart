import 'package:flutter/material.dart';
import 'package:tam_drive/UI/UiComponent.dart/Button.dart';
import 'package:tam_drive/UI/UiComponent.dart/TextField.dart';
import 'package:tam_drive/UI/login.dart';
import 'package:tam_drive/business/manageUser.dart';
import 'package:tam_drive/core/constants/extension.dart';
import 'package:tam_drive/core/models/post/userSignup.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  userSignup signup = userSignup();
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
                width: size.width * .95,
                height: size.height * .1,
                child: Image.asset("assets/images/q_6.png"),
              ),
            ),
            SizedBox(
              width: size.width * .95,
              height: size.height * .45,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TamTaxtField(
                        inputType: TextInputType.name,
                        label: "الأسم الأول",
                        width: .41,
                        onChanged: (String v) {
                          setState(() {
                            signup.firstName = v;
                          });
                        },
                      ),
                      TamTaxtField(
                        inputType: TextInputType.name,
                        label: "الأسم الاخير",
                        width: .41,
                        onChanged: (String v) {
                          setState(() {
                            signup.lastName = v;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TamTaxtField(
                        inputType: TextInputType.number,
                        label: "رقم الهاتف",
                        width: .625,
                        onChanged: (String v) {
                          setState(() {
                            signup.phone = "0$v";
                          });
                        },
                      ),
                      TamTaxtField(
                        isReadOnly: true,
                        label: "00962",
                        width: .205,
                        onChanged: (String v) {
                          print(v);
                        },
                      ),
                    ],
                  ),
                  TamTaxtField(
                    inputType: TextInputType.emailAddress,
                    label: "البريد الألكتروني",
                    width: .85,
                    onChanged: (String v) {
                      setState(() {
                        signup.email = v;
                      });
                    },
                  ),
                  TamTaxtField(
                    isSecured: true,
                    label: "كلمة السر",
                    width: .85,
                    onChanged: (String v) {
                      print(v);
                    },
                  ),
                  TamTaxtField(
                    isSecured: true,
                    label: "تأكيد كلمة السر",
                    width: .85,
                    onChanged: (String v) {
                      setState(() {
                        signup.password = v;
                      });
                    },
                  ),
                ],
              ),
            ),
            TamButton(
                onPressed: () {
                  authManager.signup(signup).then((value) {
                    if (authManager.res.isSucess!) {
                      authManager.res.replaceSpecific(context, const Login());
                    } else {
                      authManager
                          .setErrorResult(authManager.res.message!.text!)
                          .replace(context);
                    }
                  });
                },
                label: "تسجيل",
                width: 0.85)
          ],
        ),
      ),
    ));
  }
}
