import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/services/service_fundraising.dart';
import '../../model/model_fundraising.dart';

class FundraisingViewModel with ChangeNotifier {
  ModelFundraising? modelFundraising;
  final service = FundraisingService();
  final TextEditingController search = TextEditingController();
  bool isLoading = false;
  bool dataHasilSearch = false;

  Future<void> getAllFundraising() async {
    isLoading = true;
    final data = await service.getAllFundraising();
    modelFundraising = data;
    isLoading = false;
    notifyListeners();
  }

  Future fetchSearchFundraising({
    required String query,
  }) async {
    try {
      modelFundraising = await service.hitSearchFundraising(query: query);
      dataHasilSearch = false;
      notifyListeners();
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        dataHasilSearch = true;
        notifyListeners();
        e.response!.statusCode;
      }
    }
  }
}
