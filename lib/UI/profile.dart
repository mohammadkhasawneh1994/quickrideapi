import 'package:flutter/material.dart';
import 'package:tam_drive/UI/home.dart';
import 'package:tam_drive/UI/myorder.dart';
import 'package:tam_drive/core/constants/values.dart';

class Profile extends StatelessWidget {
  String username;
  Profile({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Container(
          color: TamColors.white,
          height: size.height,
          width: size.width * .8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Material(
                color: TamColors.violet,
                child: InkWell(
                  onTap: () {
                    /// Close Navigation drawer before
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile(
                                username: username,
                              )),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top, bottom: 24),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 52,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c21pbHklMjBmYWNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          username,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 28, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const ListTile(
                    title: Text(''),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Text('الرئيسية'),
                    onTap: () {
                      /// Close Navigation drawer before
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite_border),
                    title: const Text('رحلاتي'),
                    onTap: () {
                      /// Close Navigation drawer before
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyOrder()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
