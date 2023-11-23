import 'package:flutter/material.dart';

class HomeScreenViewModel extends ChangeNotifier {
  String _searchText = '';
  String _errorText = '';

  String get searchText => _searchText;
  String get errorText => _errorText;

  var currentIndex = 0;

  void setSearchText(String text) {
    _searchText = text;
    _errorText = '';
    notifyListeners();
  }

  /*bool validateSearchText() {
    if (_searchText.isEmpty) {
      _errorText = 'Teks pencarian tidak boleh kosong';
      notifyListeners();
      return false;
    }
    return true;
  }*/

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
