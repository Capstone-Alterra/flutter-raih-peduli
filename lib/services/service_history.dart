import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_history.dart';
import 'package:flutter_raih_peduli/utils/utils.dart';

class HistoryService {
  final Dio _dio = Dio();

  Future<HistoryAll> fetchHistoryAll({
    required String token,
  }) async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.historyAll,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      debugPrint("=>${response.data}");
      return historyAllFromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}