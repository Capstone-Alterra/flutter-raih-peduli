import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/home/homescreen.dart';
import 'package:flutter_raih_peduli/screen/view/riwayat/riwayat.dart';
import 'package:flutter_raih_peduli/screen/view/settings/settings_view.dart';

class NavigationProvider extends ChangeNotifier {
  var pageIndex = 0;
  List<Widget> navigationbar = [
    HomeScreen(),
    const SettingScreen(),
    const Riwayat(),
  ];
  
  void updateIndex(int index) {
    pageIndex = index;
    notifyListeners();
  }
}