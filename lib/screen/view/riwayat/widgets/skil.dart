import 'package:flutter/material.dart';

Widget skil({String? text, double? size}) {
  return Container(
    width: size,
    height: 15,
    decoration: BoxDecoration(
      color: const Color(0xFFEFFAF4),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          8.0,
        ),
      ),
      border: Border.all(
        color: const Color(0xFF293066),
        width: 0.7,
      ),
    ),
    child: Center(
      child: Text(
        text ?? "",
        style: const TextStyle(
          fontSize: 8,
        ),
      ),
    ),
  );
}
