import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_otp.dart';
import '../../services/service_sign_up.dart';

class SignUpViewModel with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  final List<String> genderList = ['Jenis Kelamin', 'Laki-Laki', 'Perempuan'];
  String selectedGender = 'Jenis Kelamin';
  bool agree = false;
  bool isResponseSuccess = false;
  String kodeOtp = "";
  final service = SignUpService();
  ModelOtp? otp;
  bool isPasswordVisible = false;
  bool heightContainer = false;

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

  Future verifikasi({
    required String kodeOtp,
  }) async {
    try {
      otp = await service.verifikasiOtp(
        otp: kodeOtp,
      );

      isResponseSuccess = true;
      fullname.clear();
      email.clear();
      selectedGender = 'Select Gender';
      address.clear();
      phone.clear();
      password.clear();
      notifyListeners();
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        isResponseSuccess = false;
        e.response!.statusCode;
      }
    }
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
      return 'Format email salah';
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'Alamat tidak boleh kosong';
    }
    return null;
  }

  String? validateGender(String value) {
    if (value.isEmpty || value == 'Jenis Kelamin') {
      return 'Pilih jenis kelamin';
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'Nomor tidak boleh kosong';
    } else if (!value.startsWith('0')) {
      return 'Nomor harus diawali 0';
    } else if (value.length < 10) {
      return 'Nomor minimal 10 digit';
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

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void setAwalGender() {
    selectedGender = 'Jenis Kelamin';
    agree = false;
  }
}
