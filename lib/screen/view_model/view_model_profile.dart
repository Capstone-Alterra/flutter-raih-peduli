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
  bool isEdit = false;

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

  Future fetchProfileTanpaLoading({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      modelProfile = await service.hitProfile(token: accessToken);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        modelProfile = await service.hitProfile(token: refreshToken);
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }

  Future fetchNik({
    required String accessToken,
    required String refreshToken,
    required String email,
  }) async {
    String fullName = fullNameController.text.isEmpty
        ? modelProfile!.data.fullname
        : fullNameController.text;
    String phone = telpController.text.isEmpty
        ? modelProfile!.data.phoneNumber
        : telpController.text;
    String alamat = alamatController.text.isEmpty
        ? modelProfile!.data.address
        : alamatController.text;
    String nik = nikController.text.isEmpty
        ? modelProfile!.data.nik
        : nikController.text;
    try {
      await service.hitUpdateProfile(
        token: accessToken,
        fullname: fullName,
        email: email,
        nik: nik,
        phone: phone,
        address: alamat,
      );
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        await service.hitUpdateProfile(
          token: refreshToken,
          fullname: fullName,
          email: email,
          nik: nik,
          phone: phone,
          address: alamat,
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

  void enable() {
    isEdit = !isEdit;
    notifyListeners();
  }

  void clearAll() {
    fullNameController.clear();
    emailController.clear();
    telpController.clear();
    alamatController.clear();
    nikController.clear();
  }
}
