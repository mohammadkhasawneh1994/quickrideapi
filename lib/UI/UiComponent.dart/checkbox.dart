import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TamCheckBox extends StatelessWidget {
  bool? dafaultValue;
  Function(bool?)? onChanged;
  String label;
  double width;

  TamCheckBox(
      {required this.onChanged,
      required this.label,
      required this.width,
      required this.dafaultValue,
      super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      //padding: const EdgeInsets.only(right: 10),
      width: size.width * width,
      height: size.height * .04,
      child: Row(
        children: [
          Checkbox(
              value: dafaultValue,
              activeColor: const Color(0xff7C4DA6),
              onChanged: onChanged),
          Text(
            label,
            style: const TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
