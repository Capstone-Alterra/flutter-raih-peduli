import 'package:flutter/material.dart';

Widget statusRiwayat(
    {String? text, double? sizeWidht, double? sizeHeight, Color? color}) {
  return Container(
    width: sizeWidht,
    height: sizeHeight,
    decoration: BoxDecoration(
      color: const Color(0xFFEFFAF4),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          16.0,
        ),
      ),
      border: Border.all(
        color: color ?? const Color(0xFFBB5902),
        width: 0.7,
      ),
    ),
    child: Center(
      child: Text(
        text ?? '',
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    ),
  );
}
