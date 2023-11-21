import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/home/homescreen.dart';
import 'package:provider/provider.dart';
import 'screen/view_model/view_model_homescreeen.dart';
import 'screen/view_model/view_model_donate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DonateViewModel()),
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
        home: HomeScreen(),
      ),
    );
  }
}
