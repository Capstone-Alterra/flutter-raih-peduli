import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_transaction.dart';
import 'package:flutter_raih_peduli/services/service_transaction.dart';

class TransactionViewModel with ChangeNotifier {
  ModelTransaction? modelTransaction;
  final service = TransactionService();
  // bool isLoading = false;

  Future createTransaction({
    required String accessToken,
    required String refreshToken,
    required int fundraiseId,
    required int paymentType,
    required int amount,
  }) async {
    try {
      // isLoading = true;
      modelTransaction = await service.hitTransaction(
        token: accessToken,
        fundraiseId: fundraiseId,
        paymentType: paymentType,
        amount: amount,
      );

      // isLoading = false;
      notifyListeners();
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        // isLoading = true;
        modelTransaction = await service.hitTransaction(
          token: refreshToken,
          fundraiseId: fundraiseId,
          paymentType: paymentType,
          amount: amount,
        );
        // isLoading = false;
        notifyListeners();
        e.response!.statusCode;
      }
    }
  }
}
