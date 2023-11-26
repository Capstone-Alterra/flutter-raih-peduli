import 'package:flutter/material.dart';

class SettingsViewProvider extends ChangeNotifier {
  var currentIndex = 0;
  
  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}