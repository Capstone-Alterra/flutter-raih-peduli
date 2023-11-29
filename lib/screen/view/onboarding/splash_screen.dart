import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SignInViewModel autoLogin;
  @override
  void initState() {
    autoLogin = Provider.of<SignInViewModel>(context, listen: false);
    super.initState();
    autoLogin.checkLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        "assets/splash_screen.png",
        width: 120.0,
        height: 120.0,
        fit: BoxFit.fill,
      ),
    ));
  }
}
