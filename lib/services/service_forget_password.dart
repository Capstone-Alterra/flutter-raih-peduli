// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_otp.dart';
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

  Future<Object> fecthNewOtp(String email) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.reSendOtp,
        data: {
          'email': email,
        },
      );
      debugPrint("=>${response.data}");
      return false;
    } catch (error) {
      debugPrint('Terjadi kesalahan saat melakukan permintaan: $error');
      return false;
    }
  }

  Future<ModelOtp> verifikasiOtpForgetPassword({
    required String otp,
  }) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.otpForgetPassword,
        data: {
          'otp': otp,
        },
      );
      debugPrint("=>${response.data}");
      return ModelOtp.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
