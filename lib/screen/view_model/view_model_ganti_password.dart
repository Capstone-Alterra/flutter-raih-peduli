import 'package:flutter/material.dart';

class GantiPasswordViewModel with ChangeNotifier {
    final formKey = GlobalKey<FormState>();
  final TextEditingController passwordLama = TextEditingController();
  final TextEditingController passwordBaru = TextEditingController();
  bool isPasswordVisiblePasswordLama = false;
  bool isPasswordVisiblePasswordBaru = false;
  
    String? validatePasswordBaru(String value) {
    if (value.isEmpty) {
      notifyListeners();
      return 'Password tidak boleh kosong';
    } else if (value.length < 8) {
      notifyListeners();
      return 'Password harus memiliki setidaknya 8 karakter';
    } else if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).+$').hasMatch(value)) {
      notifyListeners();
      return 'Password harus berupa kombinasi huruf dan angka';
    }
    notifyListeners();
    return null;
  }

    void togglePasswordVisibilityPasswordLama() {
    isPasswordVisiblePasswordLama = !isPasswordVisiblePasswordLama;
    notifyListeners();
  }
      void togglePasswordVisibilityPasswordBaru() {
    isPasswordVisiblePasswordBaru = !isPasswordVisiblePasswordBaru;
    notifyListeners();
  }
}
