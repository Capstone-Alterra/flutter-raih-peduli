import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_onboarding.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SignInViewModel autoLogin;
  late OnBoardingViewModel skipOnboarding;
  @override
  void initState() {
    autoLogin = Provider.of<SignInViewModel>(context, listen: false);
    skipOnboarding = Provider.of<OnBoardingViewModel>(context, listen: false);
    super.initState();
    skipOnboarding.checkDownload(context);
    autoLogin.checkLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ukuran = (size.width + size.height) / 5;
    return Scaffold(
        body: Center(
      child: Image.asset(
        "assets/splash_screen.png",
        width: ukuran,
        height: ukuran,
        fit: BoxFit.fill,
      ),
    ));
  }
}
