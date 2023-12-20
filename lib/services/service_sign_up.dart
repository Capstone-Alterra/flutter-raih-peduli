// ignore_for_file: deprecated_member_use, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_raih_peduli/model/model_otp.dart';
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
      final Map<String, dynamic> jsonData = response.data;
      final ModelSignUp modelSignUp = modelSignUpFromJson(jsonData);
      return modelSignUp;
    } catch (error) {
      print('Terjadi kesalahan saat melakukan permintaan: $error');
      return null;
    }
  }

  Future<ModelOtp> verifikasiOtp({required String otp}) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.verifikasiOtp,
        data: {
          'otp': otp,
        },
      );
      return ModelOtp.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
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
      print(response.statusCode);
      return false;
    } catch (error) {
      print('Terjadi kesalahan saat melakukan permintaan: $error');
      return false;
    }
  }
}
