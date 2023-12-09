import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../services/service_personalisasi.dart';

class PersonalisasiViewModel with ChangeNotifier {
  List<String> selectedItems = [];
  final service = PersonalisasiService();
  bool iscoba = false;

  void toggleSelection(String item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
    notifyListeners();
  }

  bool isItemSelected(String item) {
    return selectedItems.contains(item);
  }

  Future<void> fetchPersonalisasi({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      await service.hitPersonalisasi(
        token: accessToken,
        personalization1: 'Panti Asuhan',
        personalization2: '',
        personalization3: '',
      );
      iscoba = false;
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        service.hitPersonalisasi(
          token: refreshToken,
          personalization1: 'Kesehatan',
          personalization2: '',
          personalization3: '',
        );
        iscoba = false;
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }
}
