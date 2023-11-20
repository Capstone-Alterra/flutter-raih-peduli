import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_sign_in.dart';
import '../utils/utils.dart';

class SignInService {
  final Dio _dio = Dio();

  Future<ModelSignIn?> signInAccount(String email, String password) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.signIn,
        data: {
          'email': email,
          'password': password,
        },
      );
      debugPrint(response.data);
      final Map<String, dynamic> jsonData = response.data;
      final ModelSignIn modelSignIn = modelSignInFromJson(jsonData);
      return modelSignIn;
    } catch (error) {
      debugPrint('Terjadi kesalahan saat melakukan permintaan: $error');
      return null;
    }
  }
}
