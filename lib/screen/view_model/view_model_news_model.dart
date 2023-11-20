import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_news.dart';
import 'package:flutter_raih_peduli/services/service.dart';
import 'package:flutter_raih_peduli/utils/utils.dart';

class NewsProvider with ChangeNotifier {
  bool isDataEmpty = true;
  bool isloading = true;
  bool isloadingSearch = true;
  TopNewsModel? resNews;
  TopNewsModel? resSearch;

  setLoading(data) {
    isloading = data;
    notifyListeners();
  }

  getTopHeadlines() async {}

  getTopNews() async {
    //memanggil api get news
    final res = await api('${baseUrl}top-headlines?country=us&apiKey=$apiKey');
    if (res.statusCode == 200) {
      resNews = TopNewsModel.fromJson(res.data);
    } else {
      resNews = TopNewsModel();
    }
    isloading = false;
    notifyListeners();
  }

  search(String search) async {
    //print(search);
    isDataEmpty = false;
    isloadingSearch = true;
    notifyListeners();
    final res = await api(
        '${baseUrl}everything?q=$search&sortBy=popularity&apiKey=$apiKey');
    if (res.statusCode == 200) {
      resSearch = TopNewsModel.fromJson(res.data);
    } else {
      resSearch = TopNewsModel();
    }
    isloadingSearch = false;
    notifyListeners();
  }
}
