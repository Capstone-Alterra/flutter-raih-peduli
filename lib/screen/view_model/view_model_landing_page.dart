import 'package:flutter/material.dart';
import '../view/login_screen.dart';

class LandingPageViewModel with ChangeNotifier {
  int _currentPage = 1;

  int get currentPage => _currentPage;

  void nextPage() {
    if (_currentPage < 4) {
      _currentPage++;
      notifyListeners();
    }
  }

  void skipToLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
    notifyListeners();
  }
}