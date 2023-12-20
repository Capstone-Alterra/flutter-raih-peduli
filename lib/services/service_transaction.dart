// ignore_for_file: deprecated_member_use, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_raih_peduli/model/model_transaction.dart';

import '../utils/utils.dart';

class TransactionService {
  final Dio _dio = Dio();

  Future<ModelTransaction> hitTransaction({
    required String token,
    required int fundraiseId,
    required int paymentType,
    required int amount,
  }) async {
    try {
      final formData = FormData.fromMap({
        'fundraise_id': fundraiseId,
        'payment_type': paymentType,
        'amount': amount,
      });

      final response = await _dio.post(
        Urls.baseUrl + Urls.createTransaction,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: formData,
      );
      return ModelTransaction.fromJson(response.data);
    } on DioError catch (error) {
      print("Error: ${error.message}");
      rethrow;
    }
  }
}
