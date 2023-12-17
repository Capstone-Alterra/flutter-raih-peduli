import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_detail_news.dart';
import 'package:flutter_raih_peduli/services/service_news.dart';
import '../../model/model_news.dart';
import '../../model/model_news_pagination.dart';

class NewsViewModel with ChangeNotifier {
  ModelNews? modelNews;
  ModelDetailNews? modelDetailNews;
  ModelNewsPagination? modelNewsPagination;
  final service = NewsService();
  final TextEditingController search = TextEditingController();
  bool isLoading = false;
  bool dataHasilSearch = false;
  bool isSearch = false;
  int indexPagination = 1;
  late final scrollController = ScrollController();
  bool isLoadingDetail = true;


  Future<void> fetchAllNews({required String accessToken, required String refreshToken}) async {
    try {
      isLoading = true;
      final data = await service.hitAllNews(index: indexPagination, token: refreshToken);
      modelNews = data;
      isLoading = false;
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        isLoading = true;
        final data = await service.hitAllNews(index: indexPagination, token: refreshToken);
        modelNews = data;
        isLoading = false;
      }
    }

    notifyListeners();
  }

  Future fetchSearchNews({
    required String query,
  }) async {
    try {
      isSearch = true;
      notifyListeners();
      modelNews = await service.hitSearchNews(query: query);
      dataHasilSearch = false;

      notifyListeners();
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        dataHasilSearch = true;
        notifyListeners();
        e.response!.statusCode;
      }
    }
  }

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}...';
  }

  Future<void> fetchNewsPagination({required String accessToken, required String refreshToken}) async {
    try{
      isSearch = false;
      isLoading = true;
      final data = await service.hitNewsPagination(index: indexPagination, token: refreshToken);
      modelNewsPagination = data;
      isLoading = false;
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        isSearch = false;
        isLoading = true;
        final data = await service.hitNewsPagination(index: indexPagination, token: refreshToken);
        modelNewsPagination = data;
        isLoading = false;
      }
    }
    notifyListeners();
  }

  void scrollListener({
    required String accessToken,
    required String refreshToken,
  }) async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      try {
        indexPagination++;
        notifyListeners();
        final newData = await service.hitNewsPagination(index: indexPagination, token: refreshToken);
        modelNewsPagination?.addAllData(newData.data);
      }catch (e) {
        // ignore: deprecated_member_use
        if (e is DioError) {
          final newData = await service.hitNewsPagination(index: indexPagination, token: refreshToken);
          modelNewsPagination?.addAllData(newData.data);
        }
      }

    }
    notifyListeners();
  }

  void awal() async {
    indexPagination = 1;
    isSearch = false;
  }

  Future fetchDetailNews({
    required int id,
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      isLoadingDetail = false;
      modelDetailNews = await service.hitDetailNews(
        id: id,
        token: refreshToken,
      );
      isLoadingDetail = true;
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        isLoadingDetail = false;
        modelDetailNews = await service.hitDetailNews(
          id: id,
          token: refreshToken,
        );
        isLoadingDetail = true;
      }
    }
    notifyListeners();
  }
}
