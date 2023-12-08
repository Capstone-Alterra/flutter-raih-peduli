import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme.dart';
Widget customAmountButton(
    {
      double? width,
      double? height,
      Color? bgColor,
      Color? textColor,
      VoidCallback? onTap,
      String? text}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: bgColor, border: Border.all(width: 2, color: AppTheme.tertiaryColor)),
        child: Center(
            child: Text(
              text ?? "",
              style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Helvetica"),
            ))),
  );
}
