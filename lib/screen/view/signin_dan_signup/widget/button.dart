import 'package:flutter/material.dart';

Widget customButton({
  String? labelText,
  Color? bgColor,
  VoidCallback? onPressed,
  String? text
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    onPressed: onPressed,
    child:  SizedBox(
        width: double.infinity, child: Center(child: Text(text ?? ""))),
  );
}
