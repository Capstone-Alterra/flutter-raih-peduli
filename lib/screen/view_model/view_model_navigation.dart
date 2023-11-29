import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/home/homescreen.dart';
import 'package:flutter_raih_peduli/screen/view/riwayat/riwayat.dart';
import 'package:flutter_raih_peduli/screen/view/settings/settings_view.dart';

import '../view/chatbot/chatbot_screen.dart';

class NavigationProvider extends ChangeNotifier {
  var pageIndex = 0;
  List<Widget> navigationbar = [
    HomeScreen(),
    const ChatbotScreen(),
    const Riwayat(),
    const SettingScreen(),
  ];

  void updateIndex(int index) {
    pageIndex = index;
    notifyListeners();
  }

  void out() {
    pageIndex = 0;
    notifyListeners();
  }
}
