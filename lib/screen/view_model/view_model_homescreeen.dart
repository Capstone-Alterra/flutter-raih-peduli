import 'package:flutter/material.dart';

class HomeScreenViewModel with ChangeNotifier {
  String _searchText = '';
  String _errorText = '';

  String get searchText => _searchText;
  String get errorText => _errorText;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

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

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}