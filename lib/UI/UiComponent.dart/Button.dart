import 'package:flutter/material.dart';
import 'package:tam_drive/core/constants/values.dart';

// ignore: must_be_immutable
class TamButton extends StatelessWidget {
  Function()? onPressed;
  String label;
  bool isReadOnly;
  double width;

  TamButton(
      {required this.onPressed,
      required this.label,
      required this.width,
      this.isReadOnly = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(right: 10),
      width: size.width * width,
      height: size.height * .075,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(TamColors.violet),
          foregroundColor: const WidgetStatePropertyAll(TamColors.white),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
        ),
        child: Text(label),
      ),
    );
  }
}
