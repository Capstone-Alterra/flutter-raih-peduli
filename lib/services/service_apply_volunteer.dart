import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/utils/utils.dart';

class ApplyVolunteerService {
  final Dio dio = Dio();

  Future<void> hitApplyVolunteer({
    required String token,
    required int id,
    required String skills,
    required String resume,
    required String reason,
    required File foto,
  }) async {
    try {
      final formData = FormData.fromMap({
        'vacancy_id': id,
        'skills': skills,
        'resume': resume,
        'reason': reason,
        'photo': await MultipartFile.fromFile(
          foto.path,
          filename: 'photo.jpg',
        ),
      });

      final response = await dio.post(
        Urls.baseUrl + Urls.applyVolunteer,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: formData,
      );

      debugPrint("API Response: ${response.data}");
    } catch (e) {
      debugPrint("Unexpected error: $e");
      rethrow;
    }
  }
}