// ignore_for_file: deprecated_member_use, avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_raih_peduli/model/model_profile.dart';

import '../utils/utils.dart';

class ProfileService {
  final Dio _dio = Dio();

  Future<ModelProfile> hitProfile({
    required String token,
  }) async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.profile,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return ModelProfile.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<void> hitUpdateProfile({
    required String token,
    required String email,
    required String fullname,
    required String address,
    required String phone,
    required String nik,
    required File? foto,
    required String photo,
  }) async {
    try {
      FormData formData;
      if (foto != null) {
        formData = FormData.fromMap({
          'email': email,
          'fullname': fullname,
          'address': address,
          'phone_number': phone,
          'nik': nik,
          'profile_picture': await MultipartFile.fromFile(
            foto.path,
            filename: 'photo.jpg',
          ),
        });
      } else {
        // Use modelProfile!.data.profilePicture if imageFile is null
        formData = FormData.fromMap({
          'email': email,
          'fullname': fullname,
          'address': address,
          'phone_number': phone,
          'nik': nik,
          'profile_picture': photo,
        });
      }

      final response = await _dio.put(
        Urls.baseUrl + Urls.updateProfile,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: formData,
      );
  print(response.statusCode);
      return;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
