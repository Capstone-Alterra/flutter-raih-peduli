// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_profile.dart';

import '../utils/utils.dart';

class ProfileService {
  final Dio _dio = Dio();

  Future<ModelProfile> hitProfile({
    required String token,
  }) async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.profile,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      debugPrint("=>${response.data}");
      return ModelProfile.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
