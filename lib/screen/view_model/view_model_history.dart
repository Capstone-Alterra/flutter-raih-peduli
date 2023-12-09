import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_history.dart';
import 'package:flutter_raih_peduli/services/service_history.dart';

class ProfileViewModel with ChangeNotifier {
  HistoryAll? historyAll;
  final service = HistoryService();
  bool isLoading = false;

  Future fetchProfile({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      isLoading = true;
      historyAll = await service.fetchHistoryAll(token: accessToken);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        isLoading = true;
        notifyListeners();
        historyAll = await service.fetchHistoryAll(token: refreshToken);
        isLoading = false;
        notifyListeners();
        e.response!.statusCode;
      }
    }
  }
}
