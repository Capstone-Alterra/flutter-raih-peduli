// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_detail_news.dart';
import 'package:flutter_raih_peduli/model/model_news.dart';

import '../model/model_news_pagination.dart';
import '../utils/utils.dart';

class NewsService {
  final Dio _dio = Dio();

  Future<ModelNews> hitAllNews() async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.fetchAllNews,
      );
      debugPrint("=>${response.data}");
      return ModelNews.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ModelNews> hitSearchNews({
    required String query,
  }) async {
    try {
      final response = await _dio.get(Urls.baseUrl + Urls.searchNews + query);
      debugPrint("=>${response.data}");
      return ModelNews.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ModelNewsPagination> hitNewsPagination(int index) async {
    try {
      final response = await _dio.get(
        "${Urls.baseUrl + Urls.fetchNewsPagination}$index&page_size=5",
      );
      debugPrint("=>${response.data}");
      return ModelNewsPagination.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ModelDetailNews> hitDetailNews({
    required int id,
  }) async {
    try {
      final response = await _dio.get(
        "${Urls.baseUrl + Urls.detailNews}$id",
      );
      debugPrint("=>${response.data}");
      return ModelDetailNews.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
