import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/JWTToken.dart';
import 'package:flutter_raih_peduli/model/model_home.dart';
import 'package:flutter_raih_peduli/services/service_home.dart';
import 'package:flutter_raih_peduli/services/service_jwttoken.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel with ChangeNotifier {
  ModelHome? modelHome;
  JwtTokenModel? jwtTokenModel;
  final service = HomeService();
  final serviceJWT = JWTTokenServices();
  bool isLoading = false;
  String accessToken = '';
  String refreshToken = '';

  Future fetchHome() async {
    await jwtToken();
    try {
      isLoading = true;
      modelHome = await service.hitHome(token: accessToken);
      isLoading = false;
    } catch (e) {
      if (e is DioException) {
        await jwtAuthentication();
        await jwtToken();
        fetchHome();
      }
    }
    notifyListeners();
  }

  Future<void> jwtAuthentication() async {
    jwtTokenModel = await serviceJWT.jwtAuthentication(
        accessToken: accessToken, refreshToken: refreshToken);
    if (jwtTokenModel != null) {
      final sp = await SharedPreferences.getInstance();
      sp.setString('access_token', jwtTokenModel!.data.accessToken);
      sp.setString('refresh_token', jwtTokenModel!.data.refreshToken);
    }
  }

  Future<void> jwtToken() async {
    final sp = await SharedPreferences.getInstance();
    accessToken = sp.getString('access_token')!;
    refreshToken = sp.getString('refresh_token')!;
  }
}
