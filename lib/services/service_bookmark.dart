// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_raih_peduli/model/model_bookmark.dart';
import 'package:flutter_raih_peduli/utils/utils.dart';

class BookmarkService {
  final Dio dio = Dio();

  Future<void> postBookmark({
    required String token,
    required String postType,
    required int id,
  }) async {
    try {
      final response = await dio.post(
        Urls.baseUrl + Urls.bookmark,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'post_id': id,
          'post_type': postType,
        },
      );

      print(response.data);
    } catch (e) {
      print("Unexpected error: $e");
      rethrow;
    }
  }

  Future<ModelBookmark> getBookmark({
    required String token,
  }) async {
    try {
      final response = await dio.get(
        Urls.baseUrl + Urls.bookmark,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return ModelBookmark.fromJson(response.data);
    } catch (e) {
      print("Unexpected error: $e");
      rethrow;
    }
  }

  Future<void> deleteBookmark({
    required String token,
    required String idBookmark,
  }) async {
    try {
      final response = await dio.delete(
        Urls.baseUrl + Urls.bookmark + idBookmark,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print("=>${response.data}");
    } catch (e) {
      print("Unexpected error: $e");
      rethrow;
    }
  }
}
