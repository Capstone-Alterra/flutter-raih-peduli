import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_bookmark.dart';
import 'package:flutter_raih_peduli/services/service_bookmark.dart';

class ViewModelBookmark with ChangeNotifier {
  final service = BookmarkService();
  ModelBookmark? bookmarkModel;
  bool isLoading = true;
  String selectedFilter = 'Semua';

  void setFilter(String filter) {
    selectedFilter = filter;
    updateFilteredList();
    notifyListeners();
  }

  void updateFilteredList() {
    if (selectedFilter == 'Semua') {
      selectedFilter = 'Semua';
    } else if (selectedFilter == 'Donasi') {
      selectedFilter = 'Donasi';
    } else if (selectedFilter == 'Relawan') {
      selectedFilter = 'Relawan';
    } else if (selectedFilter == 'News') {
      selectedFilter = 'News';
    }
  }

  Future getBookmark({
    required String accessToken,
    required String refreshToken,
  }) async {
    isLoading = true;
    try {
      bookmarkModel = await service.getBookmark(
        token: accessToken,
      );
      isLoading = false;
    } catch (e) {
      isLoading = true;
      bookmarkModel = await service.getBookmark(
        token: refreshToken,
      );
      isLoading = false;
    }
    notifyListeners();
  }

  Future postBookmark({
    required String accessToken,
    required String refreshToken,
    required int id,
    required String postType,
  }) async {
    try {
      await service.postBookmark(
        token: accessToken,
        postType: postType,
        id: id,
      );
    } catch (e) {
      await service.postBookmark(
        token: refreshToken,
        postType: postType,
        id: id,
      );
    }
    notifyListeners();
  }

  Future deleteBookmark({
    required String accessToken,
    required String refreshToken,
    required String idBookmark,
  }) async {
    try {
      await service.deleteBookmark(
        token: accessToken,
        idBookmark: idBookmark,
      );
    } catch (e) {
      await service.deleteBookmark(
        token: refreshToken,
        idBookmark: idBookmark,
      );
    }
    notifyListeners();
  }
}
