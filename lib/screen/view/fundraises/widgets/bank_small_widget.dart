// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme.dart';
Widget customSmallBank(
    {
      required String photo,}) {
  return Container(
    margin:const EdgeInsets.only(right: 8),
    child: Center(
      child: Image.asset(
        photo,
        // width: 90,
        height: 30,
      ),
    ),
    decoration: BoxDecoration(border: Border.all(width: 1, color: AppTheme.secondaryColor), borderRadius: BorderRadius.circular(5) ),
  );
}
