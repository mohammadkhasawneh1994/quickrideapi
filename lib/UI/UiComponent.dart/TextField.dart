import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TamTaxtField extends StatelessWidget {
  Function(String)? onChanged;
  String label;
  bool isSecured;
  bool isReadOnly;
  double width;
  TextInputType inputType;

  TamTaxtField(
      {required this.onChanged,
      this.isSecured = false,
      required this.label,
      required this.width,
      this.isReadOnly = false,
      this.inputType = TextInputType.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 10.0, right: 10),
      padding: const EdgeInsets.only(right: 10),
      width: size.width * width,
      height: size.height * .075,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: TextField(
        keyboardType: inputType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: label,
        ),
        obscureText: isSecured,
        readOnly: isReadOnly,
        onChanged: onChanged,
      ),
    );
  }
}
