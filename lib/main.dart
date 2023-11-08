import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/login.dart';
// import 'package:flutter_raih_peduli/screen/view/splash_screen.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_landing_page.dart';
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
    //     Future.delayed(Duration(seconds: 2), () {
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (context) => LoginScreen(),
    //   ));
    // });
    return   MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ChangeNotifierProvider(create: (_) => LandingPageViewModel()),
    ],
    child: MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6D6D6D),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    )
  );
  
  }
}
