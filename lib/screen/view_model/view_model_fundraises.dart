import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_fundraises.dart';
import 'package:flutter_raih_peduli/services/service_fundraises.dart';

class FundraisesViewModel with ChangeNotifier {
  ModelFundraises? modelFundraises;
  final service = FundraisesService();
  bool isLoading = false;

  FundraisesViewModel(){
    fetchAllFundraises();
  }

  Future fetchAllFundraises() async {
    try {
      isLoading = true;
      notifyListeners();
      modelFundraises = await service.hitAllFundraises();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }

      String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}...';
  }
}
