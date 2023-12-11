import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_transaction.dart';
import 'package:flutter_raih_peduli/services/service_transaction.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TransactionViewModel with ChangeNotifier {
  ModelTransaction? modelTransaction;
  final service = TransactionService();
  bool isLoading = false;


  Future<void> openGopay(
      String url,
      ) async {
    Uri gopayUrl = Uri.parse('https://maps.app.goo.gl/uLRRodxsHw54u9C3A');

    if(await canLaunchUrl(gopayUrl)) {
      await launchUrl(gopayUrl);
    } else {
      throw 'could not open the map';
    }
    notifyListeners();
  }
  Future createTransaction({
    required String accessToken,
    required String refreshToken,
    required int fundraiseId,
    required int paymentType,
    required int amount,
  }) async {
    try {
      isLoading = true;
      modelTransaction = await service.hitTransaction(
        token: accessToken,
        fundraiseId: fundraiseId,
        paymentType: paymentType,
        amount: amount,
      );

      isLoading = false;
      notifyListeners();
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        isLoading = true;
        modelTransaction = await service.hitTransaction(
          token: refreshToken,
          fundraiseId: fundraiseId,
          paymentType: paymentType,
          amount: amount,
        );
        isLoading = false;
        notifyListeners();
        e.response!.statusCode;
      }
    }
  }
}
