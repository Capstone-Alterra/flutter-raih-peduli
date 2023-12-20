// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class GantiPasswordService {
  final Dio _dio = Dio();

  Future<void> hitCheckPassword(
      {required String token, required String oldPassword}) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.checkPassword,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'old_password': oldPassword,
        },
      );
      debugPrint("=>${response.data}");
      return;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<void> hitChangePassword(
      {required String token, required String newPassword}) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.changePasswordInSetting,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'new_password': newPassword,
        },
      );
      debugPrint("=>${response.data}");
      return;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
