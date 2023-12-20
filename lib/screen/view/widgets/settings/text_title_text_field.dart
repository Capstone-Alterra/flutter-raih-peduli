import 'package:flutter/material.dart';

Widget textSetting({
  required String text,
}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: const TextStyle(
        color: Color(0xff293066),
        fontFamily: 'Helvetica',
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
