import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_sign_up.dart';
import '../utils/utils.dart';

class SignUpService {
  final Dio _dio = Dio();

  Future<ModelSignUp?> signUpAccount(
      String nameUser,
      String emailUser,
      String passwordUser,
      String addressUser,
      String phoneUser,
      String genderUser) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.signUp,
        data: {
          'phone_number': phoneUser,
          'fullname': nameUser,
          'email': emailUser,
          'password': passwordUser,
          'gender': genderUser,
          'address': addressUser,
        },
      );
      debugPrint("$response");
      final Map<String, dynamic> jsonData = response.data;
      final ModelSignUp modelSignUp = modelSignUpFromJson(jsonData);
      return modelSignUp;
    } catch (error) {
      debugPrint('Terjadi kesalahan saat melakukan permintaan: $error');
      return null;
    }
  }

  Future<Object> verifikasiOtp(String otp, String email) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.verifikasiOtp,
        data: {
          'email': email,
          'otp': otp,
        },
      );
      debugPrint("=>${response.statusCode}");
      // final Map<String, dynamic> jsonData = response.data;
      // final ModelSignUp modelSignUp = modelSignUpFromJson(jsonData);
      return false;
    } catch (error) {
      debugPrint('Terjadi kesalahan saat melakukan permintaan: $error');
      return false;
    }
  }

  Future<Object> fecthNewOtp(String email) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.reSendOtp,
        data: {
          'email': email,
        },
      );
      debugPrint("====>${response.data}");
      // final Map<String, dynamic> jsonData = response.data;
      // final ModelSignUp modelSignUp = modelSignUpFromJson(jsonData);
      return false;
    } catch (error) {
      debugPrint('Terjadi kesalahan saat melakukan permintaan: $error');
      return false;
    }
  }
}
