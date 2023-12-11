// ignore_for_file: deprecated_member_use, equal_keys_in_map

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';

class PersonalisasiService {
  final Dio _dio = Dio();

  Future<void> hitPersonalisasi({
    required String token,
    required String personalization1,
    required String personalization2,
    required String personalization3,
  }) async {
    print(
        "aaaaaaaaaa${personalization1 + personalization2 + personalization3}");
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.fetchPersonalisasi,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'personalization': personalization1,
          'personalization': personalization2,
          'personalization': personalization3,
        },
      );
      debugPrint("=>${response.data}");
      return;
    } on DioError catch (_) {
      print("aaaaaaaaaaaaaaaa");
      rethrow;
    }
  }
}
