import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/homepage.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_news_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0xFF293066),
          // brightness: Brightness.light,
          // appBarTheme: const AppBarTheme(),
        ),
        home: const HomePage(),
      ),
    );
  }
}
