import 'package:flutter/material.dart';
import 'package:tam_drive/core/constants/values.dart';

// ignore: must_be_immutable
class TamDescButton extends StatelessWidget {
  Function()? onPressed;
  double width;
  double height;
  String label;
  IconData icon;

  TamDescButton(
      {required this.onPressed,
      required this.label,
      required this.icon,
      this.width = 70,
      this.height = 70,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // <-- match_parent
      height: height, // <-- match-parent
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(TamColors.white),
          foregroundColor: const WidgetStatePropertyAll(TamColors.violet),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          )),
        ),
        onPressed: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 20,
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
