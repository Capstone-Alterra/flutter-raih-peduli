import '../../../screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/view_model/view_model_donate.dart';

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
        ],
        child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF293066),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const Homescreen(),
        ));
  }
}
