// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_volunteer.dart';
import 'package:flutter_raih_peduli/model/model_volunteer_pagination.dart';

import '../model/model_detail_volunteer.dart';
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
      final response =
          await _dio.get(Urls.baseUrl + Urls.searchVolunteer + query);
      debugPrint("=>${response.data}");
      return ModelVolunteer.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ModelDetailVolunteer> hitDetailVolunteer({
    required int id,
    required String token,
  }) async {
    try {
      final response = await _dio.get(
        "${Urls.baseUrl}${Urls.fetchDetailVolunteer}$id",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print("aaaaaaaaaaaaaaa${response.data}");
      return ModelDetailVolunteer.fromJson(response.data);
    } on DioError catch (_) {
      final response = await _dio.get(
        "${Urls.baseUrl}${Urls.fetchDetailVolunteer}$id",
      );
      print("aaaaaaaaaaaaaaa${response.data}");
      return ModelDetailVolunteer.fromJson(response.data);
    }
  }

  Future<ModelVolunteerPagination> hitVolunteerPagination(int index) async {
    try {
      final response = await _dio.get(
        "${Urls.baseUrl + Urls.fetchVolunteerPagination}$index&page_size=5",
      );
      debugPrint("=>${response.data}");
      return ModelVolunteerPagination.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
