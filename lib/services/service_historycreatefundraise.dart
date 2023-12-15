import 'package:dio/dio.dart';
import 'package:flutter_raih_peduli/model/model.historycreatefundraise.dart';
import 'package:flutter_raih_peduli/utils/utils.dart';

class HistoryCreateFundraiseServices {
  final Dio _dio = Dio();

  Future<HistoryCreateFundraiseModel> fetchhistorycreatefundraise({
    required String token,
  }) async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.fetchHistoryCreateFundraise,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return historyCreateFundraiseModelFromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
