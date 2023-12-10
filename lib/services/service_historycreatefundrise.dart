import 'package:dio/dio.dart';
import 'package:flutter_raih_peduli/model/model_historycreatefundrise.dart';
import 'package:flutter_raih_peduli/utils/utils.dart';

class HistoryCreateFundriseServices {
  final Dio _dio = Dio();

  Future<HistoryCreateFundrise> fetchHistoryCreateFundrise({
    required String token,
  }) async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.historyCreateFundriseByUser,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print("=>${response.data}");
      return historyCreateFundriseFromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
