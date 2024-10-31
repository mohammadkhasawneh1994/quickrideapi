import 'package:flutter/material.dart';
import 'package:tam_drive/core/constants/values.dart';
import 'package:tam_drive/core/models/payload.dart';

class Error extends StatefulWidget {
  final Result result;
  const Error({super.key, required this.result});

  @override
  State<Error> createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDone = false;

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
            color: TamColors.violet,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: width,
                height: height * .6,
                alignment: const AlignmentDirectional(0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2017/02/12/21/29/false-2061131_1280.png',
                    width: width * 0.5,
                    height: height * 0.2,
                    fit: BoxFit.fill,
                    alignment: const Alignment(0, 0),
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: height * 0.1,
                child: Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: Text(widget.result.statusCode!.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.w900)),
                ),
              ),
              SizedBox(
                width: width,
                height: height * 0.1,
                child: Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Text(widget.result.message!.text!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
