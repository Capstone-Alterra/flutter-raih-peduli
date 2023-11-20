import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/services/service_sign_in.dart';

class SignInViewModel with ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final service = SignInService();

  Future<void> signIn(String email, String password) async {
    service.signInAccount(email, password);
  }
}
