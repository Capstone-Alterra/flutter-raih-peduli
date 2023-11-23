import 'package:flutter/material.dart';

class AccessVolunteerViewModel extends ChangeNotifier {
  // Implement your view model logic here
  // ...
  String _searchText = '';
  String _errorText = '';

  String get searchText => _searchText;
  String get errorText => _errorText;

  bool isMenuOpen = false;
  
  bool _isOverlayVisible = false;
  bool get isOverlayVisible => _isOverlayVisible;

  // Example method:
  Future<void> fetchData() async {
    // Fetch data from API using ApiService
    // ...

    // Notify listeners to update the UI
    notifyListeners();
  }

  void setSearchText(String text) {
    _searchText = text;
    _errorText = ''; 
    notifyListeners();
  }

  void toggleMenu() {
    isMenuOpen = !isMenuOpen;
    notifyListeners();
  }

  void toggleOverlay() {
    _isOverlayVisible = !_isOverlayVisible;
    notifyListeners();
  }
}
