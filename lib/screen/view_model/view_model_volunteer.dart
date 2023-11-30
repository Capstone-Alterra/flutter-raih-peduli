import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_volunteer.dart';
import 'package:flutter_raih_peduli/services/service_volunteer.dart';

class VolunteerViewModel with ChangeNotifier {
  ModelVolunteer? modelVolunteer;
  final service = VolunteerService();
  final TextEditingController search = TextEditingController();
  bool isLoading = false;
  bool dataHasilSearch = false;
  bool isMenuOpen = false;
  bool _isOverlayVisible = false;
  bool get isOverlayVisible => _isOverlayVisible;

  VolunteerViewModel(){
    fetchAllVolunteer();
  }

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
      modelVolunteer = await service.hitSearchVolunteer(query: query);
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

  void toggleMenu() {
    isMenuOpen = !isMenuOpen;
    notifyListeners();
  }

  void toggleOverlay() {
    _isOverlayVisible = !_isOverlayVisible;
    notifyListeners();
  }
}
