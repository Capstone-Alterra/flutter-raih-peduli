import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_profile.dart';
import 'package:flutter_raih_peduli/services/service_edit_profile.dart';

class ProfileViewModel with ChangeNotifier {
  ModelProfile? modelProfile;
  final service = ProfileService();
  bool isLoading = false;

  Future fetchProfile({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      isLoading = true;
      modelProfile = await service.hitProfile(token: accessToken);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        isLoading = true;
        notifyListeners();
        modelProfile = await service.hitProfile(token: refreshToken);
        isLoading = false;
        notifyListeners();
        e.response!.statusCode;
      }
    }
  }
}
