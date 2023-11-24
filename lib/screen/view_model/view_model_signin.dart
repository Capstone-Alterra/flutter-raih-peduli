import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_sign_in.dart';
import 'package:flutter_raih_peduli/services/service_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInViewModel with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final service = SignInService();
  bool rememberMe = false;
  bool heightContainer = false;
  ModelSignIn? dataLogin;

  Future<void> signIn() async {
    final emailUser = email.text;
    final passwordUser = password.text;
    final data = await service.signInAccount(emailUser, passwordUser);
    dataLogin = data;
    email.clear;
    password.clear;
    notifyListeners();
  }

  void setRememberMe(bool value) {
    rememberMe = value;
    notifyListeners();
  }

  Future<void> saveDataSharedPreferences(
      String accessToken, String refreshToken) async {
    final emailUser = email.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailUser);
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
    notifyListeners();
  }

  String? validateEmail(String value) {
    heightContainer = true;
    notifyListeners();
    if (!EmailValidator.validate(value)) {
      return 'Format email salah';
    }
    heightContainer = false;
    notifyListeners();
    return null;
  }

  String? validatePassword(String value) {
    heightContainer = true;
    notifyListeners();
    if (value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    heightContainer = false;
    notifyListeners();
    return null;
  }
}
