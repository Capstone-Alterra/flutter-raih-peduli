import 'package:dio/dio.dart';
import 'package:flutter_raih_peduli/model/model_historycreatevolunteer.dart';
import 'package:flutter_raih_peduli/utils/utils.dart';

class HistoryCreateVolunteerServices {
  final Dio _dio = Dio();

  Future<HistoryCreateVolunteerModel> fetchhistorycreatefundraise({
    required String token,
  }) async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.fetchCreateVolunteerHistory,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return historyCreateVolunteerModelFromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
