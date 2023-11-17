import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF293066); 
  static const Color secondaryColor = Color(0xFFD1DAEC); 
  static const Color tertiaryColor = Color.fromRGBO(72, 79, 136, 1.0); 
  static const Color alterColor = Color.fromRGBO(41, 48, 102, 1.0); 
  static const Color white = Colors.white; 
  static const Color black = Colors.black; 

  //atur textstyle
  static const TextStyle titleStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.black, // Sesuaikan dengan warna teks yang diinginkan
  );

  static const TextStyle headerStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black, // Sesuaikan dengan warna teks yang diinginkan
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.white, // Sesuaikan dengan warna teks yang diinginkan
  );
}
