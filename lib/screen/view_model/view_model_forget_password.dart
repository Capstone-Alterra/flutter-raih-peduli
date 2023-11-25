import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_token_forget_password.dart';
import 'package:flutter_raih_peduli/services/service_forget_password.dart';

class ForgetPasswordViewModel with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final formKeyUbahPassword = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController konfirmasiPassword = TextEditingController();
  String kodeOtp = "";
  final service = ForgetPasswordService();
  ModelTokenForgetPassword? dataOtp;
  bool isResponseSuccess = false;
  bool heightContainer = false;
  // ModelOtp? otp;

  Future<void> getOtpViaEmail() async {
    final emailUser = email.text;
    service.fetchOtpForgetPassword(emailUser);
  }

  void verifikasiSukses() async {
    isResponseSuccess = true;
    notifyListeners();
  }

  void verifikasiGagal() async {
    isResponseSuccess = false;
    notifyListeners();
  }

  Future<void> reSendOtp() async {
    service.fecthNewOtp(email.text);
    notifyListeners();
  }

  Future<void> ubahPassword(String token) async {
    final emailUser = email.text;
    final newPassword = password.text;
    await service.ubahPasswordUser(emailUser, newPassword, token);
    email.clear();
    password.clear();
    konfirmasiPassword.clear();
    notifyListeners();
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email tidak boleh kosong';
    } else if (!EmailValidator.validate(value)) {
      return 'Format email salah';
    }
    return null;
  }

  String? validatePasswordBaru(String value) {
    if (value.isEmpty) {
      heightContainer = true;
      notifyListeners();
      return 'Password tidak boleh kosong';
    } else if (value.length < 8) {
      heightContainer = true;
      notifyListeners();
      return 'Password harus memiliki setidaknya 8 karakter';
    } else if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).+$').hasMatch(value)) {
      heightContainer = true;
      notifyListeners();
      return 'Password harus berupa kombinasi huruf dan angka';
    }
    heightContainer = false;
    notifyListeners();
    return null;
  }

  String? validateKonfirmasiPassword(String value) {
    if (value.isEmpty) {
      heightContainer = true;
      notifyListeners();
      return 'Konfirmasi password tidak boleh kosong';
    } else if (value != password.text) {
      heightContainer = true;
      notifyListeners();
      return 'Password tidak sama';
    }
    heightContainer = false;
    notifyListeners();
    return null;
  }

  void setUlang() {
    heightContainer = false;
  }

  Future logicOtp({
    required String kodeOtp,
  }) async {
    try {
      dataOtp = await service.verifikasiOtpForgetPassword(
        otp: kodeOtp,
      );

      isResponseSuccess = true;
      notifyListeners();
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        isResponseSuccess = false;
        e.response!.statusCode;
      }
    }
  }
}
