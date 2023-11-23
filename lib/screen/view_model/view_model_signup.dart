import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../model/model_sign_up.dart';
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
  // Future<void> saveSignUpData(ModelSignUp modelSignUp) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('email', modelSignUp.data.email.toString());
  // }

  void onGenderChanged(String? value) {
    if (value != null) {
      selectedGender = value;
      notifyListeners();
    }
  }
}
