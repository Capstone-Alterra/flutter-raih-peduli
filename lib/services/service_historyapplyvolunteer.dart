import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_historyapplyvolunteer.dart';
import 'package:flutter_raih_peduli/utils/utils.dart';

class HistoryApplyVolunteerServices {
  final Dio _dio = Dio();

  Future<HistoryApplyVolunteerModel> fetchHistoryApplyVolunteer({
    required String token,
  }) async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.fetchHistoryApplyVolunteer,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      debugPrint("=>${response.data}");
      return historyApplyVolunteerModelFromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
