// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter_raih_peduli/model/model_detail_fundraises.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import '../utils/utils.dart';

class FundraisesService {
  final Dio _dio = Dio();

  Future<ModelFundraisesPagination> hitAllFundraisesPagination(
    int index,
  ) async {
    try {
      final response = await _dio.get(
        "${Urls.baseUrl}${Urls.fetchFundraisesPagination}$index&page_size=5",
      );
      final newData = ModelFundraisesPagination.fromJson(response.data);
      return newData;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ModelDetailFundraises> hitDetailFundraises({
    required int id,
  }) async {
    try {
      final response = await _dio.get(
        "${Urls.baseUrl}${Urls.fetchDetailFundraises}$id",
      );
      final newData = ModelDetailFundraises.fromJson(response.data);
      return newData;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
