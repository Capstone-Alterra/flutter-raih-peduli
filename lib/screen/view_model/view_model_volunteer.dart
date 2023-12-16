// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_detail_volunteer.dart';
import 'package:flutter_raih_peduli/model/model_volunteer.dart';
import 'package:flutter_raih_peduli/services/service_volunteer.dart';

import '../../model/model_volunteer_pagination.dart';

class VolunteerViewModel with ChangeNotifier {
  ModelVolunteer? modelVolunteer;
  ModelDetailVolunteer? modelDetailVolunteer;
  ModelVolunteerPagination? modelVolunteerPagination;
  final service = VolunteerService();
  final TextEditingController search = TextEditingController();
  bool isLoading = false;
  bool dataHasilSearch = false;
  bool isMenuOpen = false;
  // bool _isOverlayVisible = false;
  bool isOverlayVisible = false;
  bool isDetail = false;
  int indexPagination = 1;
  late final scrollController = ScrollController();
  bool isSearch = false;

  Future<void> fetchAllVolunteer() async {
    isLoading = true;
    final data = await service.hitAllVolunteer();
    modelVolunteer = data;
    isLoading = false;
    notifyListeners();
  }

  Future fetchSearchVolunteer({
    required String query,
  }) async {
    try {
      isSearch = true;
      modelVolunteer = await service.hitSearchVolunteer(query: query);
      dataHasilSearch = false;
      notifyListeners();
    } catch (e) {
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

  void toggleMenu() {
    isMenuOpen = !isMenuOpen;
    notifyListeners();
  }

  void toggleOverlay() {
    isOverlayVisible = !isOverlayVisible;
    notifyListeners();
  }

  void overlay() {
    isOverlayVisible = false;
  }

  Future fetchDetailVolunteer({
    required int id,
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      isDetail = false;
      modelDetailVolunteer = await service.hitDetailVolunteer(
        id: id,
        token: refreshToken,
      );
      isDetail = true;
    } catch (e) {
      if (e is DioError) {
        isDetail = false;
        modelDetailVolunteer = await service.hitDetailVolunteer(
          id: id,
          token: refreshToken,
        );
        isDetail = true;
      }
    }
    notifyListeners();
  }

  Future<void> fetchVolunteerPagination({required String accessToken, required String refreshToken}) async {
    try{
      isSearch = false;
      isLoading = true;
      final data = await service.hitVolunteerPagination(index: indexPagination, token: refreshToken);
      modelVolunteerPagination = data;
      isLoading = false;
    }catch (e) {
      if(e is DioError){
        isSearch = false;
        isLoading = true;
        final data = await service.hitVolunteerPagination(index: indexPagination, token: refreshToken);
        modelVolunteerPagination = data;
        isLoading = false;
      }
    }

    notifyListeners();
  }

  void scrollListener({required String accessToken, required String refreshToken}) async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      try {
        indexPagination++;
        notifyListeners();
        final newData = await service.hitVolunteerPagination(index: indexPagination, token: refreshToken);
        modelVolunteerPagination?.addAllData(newData.data);
      } catch(e){
        final newData = await service.hitVolunteerPagination(index: indexPagination, token: refreshToken);
        modelVolunteerPagination?.addAllData(newData.data);
      }
    }
    notifyListeners();
  }

  void awal() async {
    indexPagination = 1;
    isSearch = false;
  }
}
