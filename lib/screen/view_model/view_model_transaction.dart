import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_raih_peduli/model/model_transaction.dart';
import 'package:flutter_raih_peduli/services/service_transaction.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:url_launcher/url_launcher.dart';

class TransactionViewModel with ChangeNotifier {
  ModelTransaction? modelTransaction;
  final service = TransactionService();
  bool isLoading = false;

  void salinKeClipboard(String teks) {
    Clipboard.setData(ClipboardData(text: teks));
    notifyListeners();
  }

  Future<void> urlLauncher(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
    notifyListeners();
  }

  saveNetworkImage(String pictUrl) async {
    debugPrint(pictUrl);
    var response = await Dio()
        .get(pictUrl, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    debugPrint(result);
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
