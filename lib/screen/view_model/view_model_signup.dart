import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../services/service_sign_up.dart';

class SignUpViewModel with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
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
    if (value != null && value != "Select Gender") {
      selectedGender = value;
      notifyListeners();
    }
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email tidak boleh kosong';
    } else if (!EmailValidator.validate(value)) {
      return 'Format Email salah';
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'Alamat tidak boleh kosong';
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'Nomor tidak boleh kosong';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (value.length < 8) {
      return 'Password harus memiliki setidaknya 8 karakter';
    } else if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).+$').hasMatch(value)) {
      return 'Password harus berupa kombinasi huruf dan angka';
    }
    return null;
  }
}
