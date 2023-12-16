import 'package:dio/dio.dart';
import 'package:flutter_raih_peduli/model/JWTToken.dart';
import 'package:flutter_raih_peduli/utils/utils.dart';

class JWTTokenServices {
  final Dio _dio = Dio();

  Future<JwtTokenModel> jwtAuthentication({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.jwtToken,
        data: {
          'access_token': accessToken,
          'refresh_token': refreshToken,
        },
      );
      return jwtTokenModelFromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
