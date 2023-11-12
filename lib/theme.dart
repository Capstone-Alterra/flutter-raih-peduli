import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color.fromRGBO(41, 48, 102, 1.0); 
  static const Color secondaryColor = Color.fromRGBO(209, 218, 236, 1.0); 
  static const Color tertiaryColor = Color.fromRGBO(72, 79, 136, 1.0); 
  static const Color alterColor = Color.fromRGBO(41, 48, 102, 1.0); 
  static const Color white = Color.fromRGBO(255, 255, 255, 1.0); 
  static const Color black = Color.fromRGBO(0, 0, 0, 1.0); 

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
