import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme.dart';

Widget customSmallBank({
  required String photo,
}) {
  return Container(
    margin: const EdgeInsets.only(right: 8),
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: AppTheme.secondaryColor,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Center(
      child: Image.asset(
        photo,
        height: 30,
      ),
    ),
  );
}
