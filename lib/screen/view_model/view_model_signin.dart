// ignore_for_file: use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_sign_in.dart';
import 'package:flutter_raih_peduli/services/service_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/navigation/navigation.dart';

class SignInViewModel with ChangeNotifier {
  late GlobalKey<FormState> formKeySignin;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final service = SignInService();
  bool rememberMe = false;
  bool heightContainer = false;
  ModelSignIn? dataLogin;
  late SharedPreferences logindata;
  late bool newUser;
  String nameSharedPreference = '';
  String emailSharedPreference = '';
  String fotoSharedPreference = '';
  String accessTokenSharedPreference = '';
  String refreshTokenSharedPreference = '';

  SignInViewModel() {
    checkSharedPreferences();
  }

  Future<void> signIn() async {
    final emailUser = email.text;
    final passwordUser = password.text;
    final data = await service.signInAccount(emailUser, passwordUser);
    dataLogin = data;
    nameSharedPreference = dataLogin!.data.fullname;
    emailSharedPreference = dataLogin!.data.email;
    fotoSharedPreference = dataLogin!.data.profilePicture;
    accessTokenSharedPreference = dataLogin!.data.accessToken;
    refreshTokenSharedPreference = dataLogin!.data.refreshToken;
    email.clear;
    password.clear;
    notifyListeners();
  }

  void setRememberMe(bool value) {
    rememberMe = value;
    notifyListeners();
  }

  Future<void> saveDataSharedPreferences(
      // String name, String foto, String accessToken, String refreshToken
      ) async {
    // final emailUser = email.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('full_name', nameSharedPreference);
    await prefs.setString('email', emailSharedPreference);
    await prefs.setString('profile_picture', fotoSharedPreference);
    await prefs.setString('access_token', accessTokenSharedPreference);
    await prefs.setString('refresh_token', refreshTokenSharedPreference);
    email.clear();
    password.clear();
    notifyListeners();
  }

  Future<void> checkSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final storedFullName = prefs.getString('full_name');
    final storedEmail = prefs.getString('email');
    final storedProfilePicture = prefs.getString('profile_picture');
    final storedAccessToken = prefs.getString('access_token');
    final storedRefreshToken = prefs.getString('refresh_token');

    nameSharedPreference = storedFullName!;
    emailSharedPreference = storedEmail!;
    fotoSharedPreference = storedProfilePicture!;
    accessTokenSharedPreference = storedAccessToken!;
    refreshTokenSharedPreference = storedRefreshToken!;
    notifyListeners();
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      heightContainer = true;
      notifyListeners();
      return 'Email tidak boleh kosong';
    } else if (!EmailValidator.validate(value)) {
      heightContainer = true;
      notifyListeners();
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

  // void setUlang() {
  //   heightContainer = false;
  // }

  void checkLogin(BuildContext context) async {
    logindata = await SharedPreferences.getInstance();
    newUser = logindata.getBool('login') ?? true;

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavgationBar(),
          ),
          (route) => false);
    }
  }
}
