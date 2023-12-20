// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
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
      return ModelVolunteer.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ModelVolunteer> hitSearchVolunteerGuest({
    required String query,
  }) async {
    try {
      final response =
          await _dio.get(Urls.baseUrl + Urls.searchVolunteer + query);
      return ModelVolunteer.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ModelVolunteer> hitSearchVolunteer({
    required String query,
    required String token,
  }) async {
    try {
      final response =
          await _dio.get(Urls.baseUrl + Urls.searchVolunteer + query);
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
      return ModelDetailVolunteer.fromJson(response.data);
    } on DioError catch (_) {
      final response = await _dio.get(
        "${Urls.baseUrl}${Urls.fetchDetailVolunteer}$id",
      );
      return ModelDetailVolunteer.fromJson(response.data);
    }
  }

  Future<ModelVolunteerPagination> hitVolunteerPagination(
      {required int index, required String token}) async {
    try {
      final response = await _dio.get(
        "${Urls.baseUrl + Urls.fetchVolunteerPagination}$index&page_size=5",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return ModelVolunteerPagination.fromJson(response.data);
    } on DioError catch (_) {
      final response = await _dio.get(
        "${Urls.baseUrl + Urls.fetchVolunteerPagination}$index&page_size=5",
      );

      return ModelVolunteerPagination.fromJson(response.data);
    }
  }
}
