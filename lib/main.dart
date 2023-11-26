import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_homescreeen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_raih_peduli/screen/view/onboarding/onboarding_view.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_forget_password.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_onboarding.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signup.dart';
import 'screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SignUpViewModel()),
          ChangeNotifierProvider(create: (_) => SignInViewModel()),
          ChangeNotifierProvider(create: (_) => ForgetPasswordViewModel()),
          ChangeNotifierProvider(create: (_) => OnBoardingViewModel()),
          ChangeNotifierProvider(create: (_) => NavigationProvider()),
          ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF293066),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const Onbording(),
        ));
  }
}
