import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_home.dart';
import 'package:flutter_raih_peduli/services/service_home.dart';

class HomeViewModel with ChangeNotifier {
  ModelHome? modelHome;
  final service = HomeService();
  bool isLoading = false;

  Future fetchHome({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      isLoading = true;
      modelHome = await service.hitHome(token: accessToken);
      isLoading = false;
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        isLoading = true;
        modelHome = await service.hitHome(token: refreshToken);
        isLoading = false;
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }
}
