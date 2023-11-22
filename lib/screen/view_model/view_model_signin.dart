import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_sign_in.dart';
import 'package:flutter_raih_peduli/services/service_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInViewModel with ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final service = SignInService();
  bool rememberMe = false;
  ModelSignIn? dataLogin;

  Future<void> signIn(String email, String password) async {
    final data = await service.signInAccount(email, password);
    dataLogin = data;
    notifyListeners();
  }

  void setRememberMe(bool value) {
    rememberMe = value;
    notifyListeners();
  }

  Future<void> saveDataSharedPreferences(
      String email, String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
    notifyListeners();
  }
  
}
