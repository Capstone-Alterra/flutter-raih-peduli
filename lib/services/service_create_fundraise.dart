import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_create_fundraise.dart';
import 'package:intl/intl.dart';
import '../utils/utils.dart';

class ServiceCreateFundraise {
  final Dio _dio = Dio();

  Future<ModelCreateFundraise> hitCreateFundraise({
    required String token,
    required String title,
    required String description,
    required int target,
    required File foto,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final DateFormat formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    try {
      final formData = FormData.fromMap({
        'title': title,
        'description': description,
        'target': target,
        'photo': await MultipartFile.fromFile(
          foto.path,
          filename: 'photo.jpg',
        ),
        'start_date': formatter.format(startDate),
        'end_date': formatter.format(endDate),
      });
      final response = await _dio.post(
        Urls.baseUrl + Urls.createFundraise,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: formData,
      );
      debugPrint("=>${response.data}");
      return ModelCreateFundraise.fromJson(response.data);
      // ignore: deprecated_member_use
    } on DioError catch (_) {
      rethrow;
    }
  }
}
