import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_profile.dart';
import 'package:flutter_raih_peduli/services/service_edit_profile.dart';

class ProfileViewModel with ChangeNotifier {
  ModelProfile? modelProfile;
  final service = ProfileService();
  bool isLoading = false;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  bool isCheckNik = true;

  Future fetchProfile({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      isLoading = true;
      modelProfile = await service.hitProfile(token: accessToken);
      isLoading = false;
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        isLoading = true;
        modelProfile = await service.hitProfile(token: refreshToken);
        isLoading = false;
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }

  Future fetchNik({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      await service.hitUpdateProfile(
        token: accessToken,
        fullname: fullNameController.text,
        email: emailController.text,
        nik: nikController.text,
        phone: telpController.text,
        address: alamatController.text,
      );
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        await service.hitUpdateProfile(
          token: refreshToken,
          fullname: fullNameController.text,
          email: emailController.text,
          nik: nikController.text,
          phone: telpController.text,
          address: alamatController.text,
        );
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }

  void setSudahLogin() {
    if (modelProfile!.data.nik == '') {
      isCheckNik = false;
    } else {
      isCheckNik = true;
    }
  }
}
