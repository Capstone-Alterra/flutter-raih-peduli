import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/home/homescreen.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_homescreeen.dart';
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
        ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF6D6D6D),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(), // Ganti dengan widget Homescreen
      ),
    );
  }
}
