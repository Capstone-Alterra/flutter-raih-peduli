// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/services/service_ganti_password.dart';

class GantiPasswordViewModel with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordLama = TextEditingController();
  final TextEditingController passwordBaru = TextEditingController();
  bool isPasswordVisiblePasswordLama = false;
  bool isPasswordVisiblePasswordBaru = false;
  bool isGagalCheckPasswordLama = false;
  bool isGagalChangePassword = false;
  final service = GantiPasswordService();

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

  Future fetchOldPassword({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      await service.hitCheckPassword(
        token: accessToken,
        oldPassword: passwordLama.text,
      );
      isGagalCheckPasswordLama = true;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        try {
          await service.hitCheckPassword(
            token: refreshToken,
            oldPassword: passwordLama.text,
          );
          isGagalCheckPasswordLama = true;
          notifyListeners();
        } catch (e) {
          if (e is DioError) {
            isGagalCheckPasswordLama = false;
            e.response!.statusCode;
          }
        }
      }
    }
  }

  Future fetchNewPassword({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      await service.hitChangePassword(
        token: accessToken,
        newPassword: passwordBaru.text,
      );
      isGagalChangePassword = true;
    } catch (e) {
      if (e is DioError) {
        try {
          await service.hitChangePassword(
            token: refreshToken,
            newPassword: passwordBaru.text,
          );
          isGagalChangePassword = true;
        } catch (e) {
          if (e is DioError) {
            isGagalChangePassword = false;
            e.response!.statusCode;
          }
        }
      }
    }

    notifyListeners();
  }
}
