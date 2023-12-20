// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_raih_peduli/model/model_sign_in.dart';
import '../utils/utils.dart';

class SignInService {
  final Dio _dio = Dio();

  Future<ModelSignIn?> signInAccount({
    required String email,
    required String password,
    required String fcm,
  }) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.signIn,
        data: {
          'email': email,
          'password': password,
          'fcm_token': fcm,
        },
      );
      print("=>${response.data}");
      final Map<String, dynamic> jsonData = response.data;
      final ModelSignIn modelSignIn = modelSignInFromJson(jsonData);
      return modelSignIn;
    } catch (error) {
      print('Terjadi kesalahan saat melakukan permintaan: $error');
      return null;
    }
  }
}
