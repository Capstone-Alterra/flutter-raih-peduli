import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_token_forget_password.dart';
import 'package:flutter_raih_peduli/services/service_forget_password.dart';

class ForgetPasswordViewModel with ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  String kodeOtp = "";
  final service = ForgetPasswordService();
  ModelTokenForgetPassword? dataOtp;

  Future<void> getOtpViaEmail() async {
    final emailUser = email.text;
    service.fetchOtpForgetPassword(emailUser);
  }

  Future<void> verifikasiOtp() async {
    final data = await service.verifikasiOtpForgetPassword(kodeOtp);
    dataOtp = data;
    notifyListeners();
  }

  Future<void> ubahPassword(String token) async {
    final emailUser = email.text;
    final newPassword = password.text;
    await service.ubahPasswordUser(emailUser, newPassword, token);

    notifyListeners();
  }
}
