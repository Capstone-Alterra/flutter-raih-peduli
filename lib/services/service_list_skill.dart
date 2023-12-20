// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
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
      return ListSkill.fromJson(response.data);
    } catch (e) {
      print("Unexpected error: $e");
      rethrow;
    }
  }
}
