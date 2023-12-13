import 'package:flutter/material.dart';

SnackBar snackBarVolunteer(Size size, context) {
  return SnackBar(
    duration: const Duration(seconds: 4),
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
    margin: EdgeInsets.only(
      left: size.width * 0.03,
      right: size.width * 0.03,
      bottom: MediaQuery.of(context).size.height - 150,
    ),
    content: Container(
      padding: EdgeInsets.all(size.width * 0.03),
      height: size.height * 0.095,
      decoration: BoxDecoration(
          color: const Color(0xffFFF6C5),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 2,
            color: const Color(0xffFFCC1B),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: Color(0xffFFAF0F),
          ),
          SizedBox(
            width: size.width * 0.7,
            child: const Text(
              'Masukkan NIK terlebih dahulu untuk mendaftar relawan :)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Helvetica',
                color: Color(0xffFFAF0F),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
