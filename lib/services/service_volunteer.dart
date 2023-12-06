// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_volunteer.dart';

import '../utils/utils.dart';

class VolunteerService {
  final Dio _dio = Dio();

  Future<ModelVolunteer> hitAllVolunteer() async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.fetchAllVolunteer,
      );
      debugPrint("=>${response.data}");
      return ModelVolunteer.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ModelVolunteer> hitSearchVolunteer({
    required String query,
  }) async {
    try {
      final response = await _dio.get(Urls.baseUrl + Urls.searchVolunteer + query);
      debugPrint("=>${response.data}");
      return ModelVolunteer.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
