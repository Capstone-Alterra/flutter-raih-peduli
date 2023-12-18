

import 'package:flutter/material.dart';

Text reusableTextDetailHistory(
  String detailText, {
  Color? color,
  TextAlign? textAlign, // Set default to left alignment
  double? size,
}) {
  return Text(
    detailText,
    textAlign: textAlign, // Use the provided textAlign parameter
    style: TextStyle(
      fontSize: size,
      color: color,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.bold,
    ),
  );
}


Container detailDonasiButton(
    BuildContext context, Function onTap, String buttonText) {
  Size size = MediaQuery.of(context).size;
  return Container(
    width: double.infinity,
    height: size.height * 0.05,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
    ),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xff293066)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      onPressed: () {
        onTap();
      },
      child: Text(buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Helvetica',
            fontSize: 18,
          )),
    ),
  );
}
