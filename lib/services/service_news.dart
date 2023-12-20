// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter_raih_peduli/model/model_detail_news.dart';
import 'package:flutter_raih_peduli/model/model_news.dart';

import '../model/model_news_pagination.dart';
import '../utils/utils.dart';

class NewsService {
  final Dio _dio = Dio();

  Future<ModelNews> hitAllNews(
      {required int index, required String token}) async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.fetchAllNews,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
   
      return ModelNews.fromJson(response.data);
    } on DioError catch (_) {
      final response = await _dio.get(
        Urls.baseUrl + Urls.fetchAllNews,
      );
     
      return ModelNews.fromJson(response.data);
    }
  }

  Future<ModelNews> hitSearchNews({
    required String query,
    required String token,
  }) async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.searchNews + query,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
     
      return ModelNews.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ModelNews> hitSearchNewsGuest({
    required String query,
  }) async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.searchNews + query,
      );
    
      return ModelNews.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ModelNewsPagination> hitNewsPagination(
      {required int index, required String token}) async {
    try {
      final response = await _dio.get(
        "${Urls.baseUrl + Urls.fetchNewsPagination}$index&page_size=5",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
   
      return ModelNewsPagination.fromJson(response.data);
    } on DioError catch (_) {
      final response = await _dio.get(
        "${Urls.baseUrl + Urls.fetchNewsPagination}$index&page_size=5",
      );
 
      return ModelNewsPagination.fromJson(response.data);
    }
  }

  Future<ModelDetailNews> hitDetailNews({
    required int id,
    required String token,
  }) async {
    try {
      final response = await _dio.get(
        "${Urls.baseUrl + Urls.detailNews}$id",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return ModelDetailNews.fromJson(response.data);
    } on DioError catch (_) {
      final response = await _dio.get(
        "${Urls.baseUrl + Urls.detailNews}$id",
      );
    
      return ModelDetailNews.fromJson(response.data);
    }
  }
}
