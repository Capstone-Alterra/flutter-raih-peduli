import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/services/service_news.dart';
import '../../model/model_news.dart';

class NewsViewModel with ChangeNotifier {
  ModelNews? modelNews;
  final service = NewsService();
  final TextEditingController search = TextEditingController();
  bool isLoading = false;

  Future<void> fetchAllNews() async {
    isLoading = true;
    final data = await service.hitAllNews();
    modelNews = data;
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchSearchNews() async {
    final hasilSearch = search.text;
    final data = await service.hitSearchNews(hasilSearch);
    modelNews = data;
    search.clear();
    notifyListeners();
  }
}
