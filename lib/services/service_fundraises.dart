// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/model/model_fundraises.dart';
import '../utils/utils.dart';

class FundraisesService {
  final Dio _dio = Dio();

  Future<ModelFundraises> hitAllFundraises() async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.fetchAllFundraises,
      );
      debugPrint("=>${response.data}");
      return ModelFundraises.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  // Future<ModelFundraisesPagination> hitAllFundraisesPagination(
  //     int index) async {
  //   try {
  //     final response = await _dio.get(
  //       "${Urls.baseUrl}${Urls.fetchFundraisesPagination}$index&page_size=3",
  //     );
  //     debugPrint("=>${response.data}");
  //     return ModelFundraisesPagination.fromJson(response.data);
  //   } on DioError catch (_) {
  //     rethrow;
  //   }
  // }
  Future<ModelFundraisesPagination> hitAllFundraisesPagination(
    int index,
  ) async {
    try {
      final response = await _dio.get(
        "${Urls.baseUrl}${Urls.fetchFundraisesPagination}$index&page_size=1",
      );
      debugPrint("=>${response.data}");

      // Ambil data dari respons
      final newData = ModelFundraisesPagination.fromJson(response.data);

      // Kembalikan data tanpa menggantikan seluruh model
      return newData;
    } on DioError catch (_) {
      rethrow;
    }
  }

  // Future<ModelNews> hitSearchNews({
  //   required String query,
  // }) async {
  //   try {
  //     final response = await _dio.get(Urls.baseUrl + Urls.searchNews + query);
  //     debugPrint("=>${response.data}");
  //     return ModelNews.fromJson(response.data);
  //   } on DioError catch (_) {
  //     rethrow;
  //   }
  // }
}
