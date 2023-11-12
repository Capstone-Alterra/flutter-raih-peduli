import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/landing_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LandingPage1())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
        "assets/DCyd2t_r_400x400.jpg",
        width: 120.0,
        height: 120.0,
        fit: BoxFit.fill,
        ),
      ),
    );
  }
}
