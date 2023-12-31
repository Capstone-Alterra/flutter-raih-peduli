// ignore_for_file: deprecated_member_use, equal_keys_in_map, avoid_print

import 'package:dio/dio.dart';
import '../utils/utils.dart';

class PersonalisasiService {
  final Dio _dio = Dio();

  Future<void> hitPersonalisasi({
    required String token,
    required String personalization1,
    required String personalization2,
    required String personalization3,
  }) async {
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
      print("=>${response.data}");
      return;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
