// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_detail_fundraises.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import '../model/model_search_fundraise.dart';
import '../utils/utils.dart';

class FundraisesService {
  final Dio _dio = Dio();

  Future<ModelFundraisesPagination> hitAllFundraisesPagination(
      {required int index, required String token}) async {
    try {
      // print(">>>>>>>>>ini masuk ke auth");
      // print(">>>>>>>woy $token");
      final response = await _dio.get(
        "${Urls.baseUrl}${Urls.fetchFundraisesPagination}$index&page_size=5",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      final newData = ModelFundraisesPagination.fromJson(response.data);
      // print(response.data);
      return newData;
    } on DioError catch (_) {
      // print(">>>>>>>ini masuk Guest");
      final response = await _dio.get(
        "${Urls.baseUrl}${Urls.fetchFundraisesPagination}$index&page_size=5",
      );
      final newData = ModelFundraisesPagination.fromJson(response.data);
      // print(response.data);
      return newData;
    }
  }

  Future<ModelDetailFundraises> hitDetailFundraises({
    required int id,
    required String token,
  }) async {
    try {
      // print(">>>>>>>>>ini masuk ke auth");
      // print(">>>>>>>woy $token");
      final response = await _dio.get(
        "${Urls.baseUrl}${Urls.fetchDetailFundraises}$id",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print(response.data);
      final newData = ModelDetailFundraises.fromJson(response.data);
      return newData;
    } on DioError catch (_) {
      // print(">>>>>>>ini masuk Guest");
      final response = await _dio.get(
        "${Urls.baseUrl}${Urls.fetchDetailFundraises}$id",
      );
      print(response.data);
      final newData = ModelDetailFundraises.fromJson(response.data);
      return newData;
    }
  }

  Future<ModelSearchFundraise> hitSearchDonation({
    required String query,
    required String token,
  }) async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.searchFundraise + query,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      debugPrint("=>${response.data}");
      return ModelSearchFundraise.fromJson(response.data);
    } on DioError catch (_) {
      final response = await _dio.get(
        Urls.baseUrl + Urls.searchFundraise + query,
      );
      debugPrint("=>${response.data}");
      return ModelSearchFundraise.fromJson(response.data);
    }
  }
}
