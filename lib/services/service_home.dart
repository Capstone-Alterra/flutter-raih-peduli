import 'package:dio/dio.dart';
import 'package:flutter_raih_peduli/model/model_home.dart';

import '../utils/utils.dart';

class HomeService {
  final Dio _dio = Dio();

  Future<ModelHome> hitHome({
    required String token,
  }) async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.fetchHome,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return ModelHome.fromJson(response.data);
      // ignore: deprecated_member_use
    } on DioError catch (_) {
      final response = await _dio.get(
        Urls.baseUrl + Urls.fetchHome,
      );
      return ModelHome.fromJson(response.data);
    }
  }
}
