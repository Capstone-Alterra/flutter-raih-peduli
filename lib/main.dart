import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/home/homescreen.dart';

import 'package:flutter_raih_peduli/screen/view_model/view_home_screen_view_model.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_news.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsViewModel()),
        ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            // primaryColor: const Color(0xFF293066),
            // brightness: Brightness.light,
            // appBarTheme: const AppBarTheme(),
            ),
        home: HomeScreen(),
      ),
    );
  }
}
