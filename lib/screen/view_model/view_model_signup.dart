import 'package:flutter/material.dart';
import '../../services/service_sign_up.dart';

class SignUpViewModel with ChangeNotifier {
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  final List<String> genderList = ['Select Gender', 'Laki-Laki', 'Perempuan'];
  String selectedGender = 'Select Gender';
  bool agree = false;
  bool isResponseSuccess = false;
  String kodeOtp = "";
  final service = SignUpService();

  Future<void> signUp() async {
    final nameUser = fullname.text;
    final emailUser = email.text;
    final passwordUser = password.text;
    final addressUser = address.text;
    final phoneUser = phone.text;
    final genderUser = selectedGender;
    service.signUpAccount(
        nameUser, emailUser, passwordUser, addressUser, phoneUser, genderUser);
  }

  void setAgreePrivasi(bool value) {
    agree = value;
    notifyListeners();
  }

  Future<void> verifikasi(String otp) async {
    service.verifikasiOtp(otp, email.text);
  }

  Future<void> reSendOtp() async {
    service.fecthNewOtp(email.text);
  }

  void onGenderChanged(String? value) {
    if (value != null) {
      selectedGender = value;
      notifyListeners();
    }
  }
}
