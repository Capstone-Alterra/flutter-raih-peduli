import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_skill.dart';
import 'package:flutter_raih_peduli/utils/utils.dart';

class ListSKillService {
  final Dio dio = Dio();

  Future<ListSkill> hitSkill({
    required String token,
  }) async {
    try {
      final response = await dio.get(
        Urls.baseUrl + Urls.listSkill,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      debugPrint("API Response: ${response.data}");
      return ListSkill.fromJson(response.data);
    } catch (e) {
      debugPrint("Unexpected error: $e");
      rethrow;
    }
  }
}
