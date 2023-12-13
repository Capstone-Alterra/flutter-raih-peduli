import 'package:dio/dio.dart';
import 'package:flutter_raih_peduli/model/model_historydonation.dart';
import 'package:flutter_raih_peduli/utils/utils.dart';

class HistoryDonationServices {
  final Dio _dio = Dio();

  Future<HistoryDonationModel> fetchHistoryDonation({
    required String token,
  }) async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.historyDonation,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print("=>${response.data}");
      return historyDonationModelFromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
