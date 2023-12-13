import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../navigation/navigation.dart';

void showCustomDialog(BuildContext context, Size size) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Selamat!',
            style: TextStyle(
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Anda berhasil mendaftar Sebagai Volunteer',
            style: TextStyle(
              fontFamily: 'Helvetica',
              color: Color(0xff4B4B4B),
            ),
          ),
        ],
      ),
      icon: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
          top: 10,
        ),
        child: Transform.scale(
          scale: size.width * .004,
          child: SvgPicture.asset('assets/ceklis_icon.svg'),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ).then((_) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomNavgationBar(),
      ),
    );
  });
}
