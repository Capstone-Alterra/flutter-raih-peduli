// ignore_for_file: deprecated_member_use, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_raih_peduli/model/model_token_forget_password.dart';
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
      print("=>${response.data}");
      return;
    } catch (error) {
      print('Terjadi kesalahan saat melakukan permintaan: $error');
      return;
    }
  }

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
      print("=>${response.data}");
      return;
    } catch (error) {
      print('Terjadi kesalahan saat melakukan permintaan: $error');
      return;
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
      print("=>${response.data}");
      return false;
    } catch (error) {
      print('Terjadi kesalahan saat melakukan permintaan: $error');
      return false;
    }
  }

  Future<ModelTokenForgetPassword> verifikasiOtpForgetPassword({
    required String otp,
  }) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.otpForgetPassword,
        data: {
          'otp': otp,
        },
      );
      return ModelTokenForgetPassword.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
