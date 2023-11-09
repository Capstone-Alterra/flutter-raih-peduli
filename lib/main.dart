import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/onBoarding/on_boarding.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_onboarding.dart';

import 'package:provider/provider.dart';

// import 'screen/view/login.dart';
import 'screen/view_model/view_model_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginViewModel()),
          ChangeNotifierProvider(create: (_) => OnBoardingViewModel()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF6D6D6D),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const Onbording(),
        ));
  }
}
