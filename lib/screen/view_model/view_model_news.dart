import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/services/service_news.dart';
import '../../model/model_news.dart';

class NewsViewModel with ChangeNotifier {
  ModelNews? modelNews;
  final service = NewsService();
  final TextEditingController search = TextEditingController();
  bool isLoading = false;
  bool dataHasilSearch = false;

  Future<void> fetchAllNews() async {
    isLoading = true;
    final data = await service.hitAllNews();
    modelNews = data;
    isLoading = false;
    notifyListeners();
  }

  Future fetchSearchNews({
    required String query,
  }) async {
    try {
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
}
