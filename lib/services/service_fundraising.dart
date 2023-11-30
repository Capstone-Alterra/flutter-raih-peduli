// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_fundraising.dart';

import '../utils/utils.dart';

class FundraisingService {
  final Dio _dio = Dio();

  Future<ModelFundraising> getAllFundraising() async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.getAllFundraises,
      );
      debugPrint("=>${response.data}");
      return ModelFundraising.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ModelFundraising> hitSearchFundraising({
    required String query,
  }) async {
    try {
      final response = await _dio.get(Urls.baseUrl + Urls.searchFundraises + query);
      debugPrint("=>${response.data}");
      return ModelFundraising.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
