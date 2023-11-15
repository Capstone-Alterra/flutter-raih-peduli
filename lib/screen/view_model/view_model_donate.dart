import 'package:flutter/material.dart';

class DonateViewModel extends ChangeNotifier {
  String searchText = '';

  void setSearchText(String value) {
    searchText = value;
    notifyListeners();
  }
}