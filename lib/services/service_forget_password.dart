import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_raih_peduli/model/model_token_forget_password.dart';
import '../model/model_token_forget_password.dart';
import '../utils/utils.dart';

class ForgetPasswordService {
  final Dio _dio = Dio();

  Future<void> fetchOtpForgetPassword(String emailUser) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.forgetPassword,
        data: {
          'email': emailUser,
        },
      );
      debugPrint("=>${response.data}");
      return;
    } catch (error) {
      debugPrint('Terjadi kesalahan saat melakukan permintaan: $error');
      return;
    }
  }

  Future<ModelTokenForgetPassword?> verifikasiOtpForgetPassword(
      String otp) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.otpForgetPassword,
        data: {
          'otp': otp,
        },
      );
      debugPrint("=>${response.data}");
      final Map<String, dynamic> jsonData = response.data;
      final ModelTokenForgetPassword modelSignIn =
          modelTokenForgetPasswordFromJson(jsonData);
      return modelSignIn;
    } catch (error) {
      debugPrint('Terjadi kesalahan saat melakukan permintaan: $error');
      return null;
    }
  }

  // Future<void> ubahPasswordUser(String emailUser, String newPassword, String token) async {
  //   try {
  //     final response = await _dio.post(
  //       Urls.baseUrl + Urls.ubahPassword,
  //       data: {
  //         'email': emailUser,
  //         'password': newPassword,
  //       },
  //         options: Options(
  //         headers: {
  //           'Authorization': 'Bearer $token',
  //         },
  //     ),
  //     debugPrint("=>${response.data}");
  //     return;
  //   } catch (error) {
  //     debugPrint('Terjadi kesalahan saat melakukan permintaan: $error');
  //     return;
  //   }
  // }
  Future<void> ubahPasswordUser(
      String emailUser, String newPassword, String token) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.ubahPassword,
        data: {
          'email': emailUser,
          'password': newPassword,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      debugPrint("=>${response.data}");
      return;
    } catch (error) {
      debugPrint('Terjadi kesalahan saat melakukan permintaan: $error');
      return;
    }
  }
}
