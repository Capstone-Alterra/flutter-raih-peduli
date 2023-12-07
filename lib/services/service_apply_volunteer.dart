import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/utils/utils.dart';

class ApplyVolunteerService {
  final Dio dio = Dio();

  Future<void> applyVolunteerWithRefreshToken(
    int volunteerId,
    List<String> selectedSkills,
    TextEditingController resumeController,
    TextEditingController reasonController,
    File imageFile,
    String imagePath,
    String accessTokenSharedPreference,
    String refreshTokenSharedPreference,
  ) async {
    try {
      final accessToken = accessTokenSharedPreference;
      final refreshToken = refreshTokenSharedPreference;

      // Baca file sebagai bytes
      //List<int> imageBytes = await imageFile.readAsBytes();

      // Encode bytes menjadi base64
      //String base64Image = base64Encode(imageBytes);

      // Kirim permintaan POST
      Response response = await dio.post(
        Urls.baseUrl + Urls.applyVolunteer,
        options: Options(
          headers: {
            'Authorization': refreshToken,
          },
        ),
        data: {
          'vacancy_id': volunteerId,
          'skills': selectedSkills.join(','),
          'resume': resumeController.text,
          'reason': reasonController.text,
          'photo': imageFile,
        },
      );

      // Cek status response
      if (response.statusCode == 200) {
        // Volunteer berhasil mendaftar
        print('Volunteer berhasil mendaftar.');
      } else {
        // Ada kesalahan dalam permintaan
        print(
            'Gagal mendaftar sebagai Volunteer. Status: ${response.statusCode}');
      }
    } catch (error) {
      // Tangani kesalahan
      print('Terjadi kesalahan: $error');
    }
  }
}
