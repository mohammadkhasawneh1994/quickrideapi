import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TamFakeTaxtField extends StatelessWidget {
  Function()? onTap;
  String label;
  double width;

  TamFakeTaxtField(
      {required this.onTap,
      required this.label,
      required this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10.0, right: 10),
        width: size.width * width,
        height: size.height * .065,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
