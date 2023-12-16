import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/JWTToken.dart';
import 'package:flutter_raih_peduli/model/model.historycreatefundraise.dart';
import 'package:flutter_raih_peduli/services/service_historycreatefundraise.dart';
import 'package:flutter_raih_peduli/services/service_jwttoken.dart';
import 'package:flutter_raih_peduli/utils/state/finite_state.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class HistoryReqDonasiViewModel extends ChangeNotifier {
  HistoryCreateFundraiseModel? historyCreateFundraiseModel;
  final services = HistoryCreateFundraiseServices();
  int remainingDays = 0;
  JwtTokenModel? jwtTokenModel;
  final serviceJWT = JWTTokenServices();
  String accessToken = '';
  String refreshToken = '';

  MyState myState = MyState.loading;

  Future<void> getCreateFundraiseHistory() async {
    await jwtToken();
    try {
      myState = MyState.loading;
      notifyListeners();

      historyCreateFundraiseModel =
          await services.fetchhistorycreatefundraise(token: accessToken);

      if (historyCreateFundraiseModel != null &&
          historyCreateFundraiseModel!.data.isNotEmpty) {
        final fundraiser = historyCreateFundraiseModel!.data.first;

        // Calculate the difference in days
        remainingDays =
            fundraiser.endDate.difference(fundraiser.startDate).inDays;
      }
      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        await jwtAuthentication();
        await jwtToken();
        getCreateFundraiseHistory();
      }
      notifyListeners();
    }
  }

  /*Future<void> getAccessToken() async {
    final getAccToken = await SharedPreferences.getInstance();
    accessToken = getAccToken.getString('access_token')!;
  }*/

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

  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd-MM-y');
    return formatter.format(dateTime);
  }

  String formattedPrice(price) => NumberFormat.currency(
        locale: 'id_ID', // This sets the currency format for Indonesian Rupiah
        symbol: 'Rp. ', // Currency symbol
        decimalDigits: 0, // Number of decimal places
      ).format(int.parse(price));

  Map<String, dynamic> getColorStatus(String status) {
    Color containerColor = const Color(0xffEFFAF4);
    Color borderColor = const Color(0xff166648);
    Color textColor = const Color(0xff166648);
    String statusText = '';
    String statusCard = '';
    String statusRespond = '';
    String detailDesc = '';
    switch (status) {
      case 'accepted':
        containerColor = const Color(0xffEFFAF4); // Green color
        borderColor = const Color(0xff166648); // Dark green color
        textColor = const Color(0xff166648); // Dark green color
        statusText = 'Diterima';
        statusCard = 'Diterima';
        statusRespond = 'Selamat Kamu Diterima Menjadi Relawan';
        detailDesc =
            'Selamat!! Permohonan Program Donasi telah berhasil diterima';
        break;
      case 'pending':
        containerColor = const Color(0xffFFFDEA); // Yellow color
        borderColor = const Color(0xffBB5902); // Dark yellow color
        textColor = const Color(0xffBB5902); // Dark yellow color
        statusText = 'Pending';
        statusCard = 'Pending (Menunggu Review Admin)';
        statusRespond = 'Kami Telah Menerima Permintaan Anda';
        detailDesc =
            'Mohon Tunggu 2-3 Hari Bagi Kami Untuk Memproses Permintaan Anda';
        break;
      default:
        containerColor = const Color(0xffFEF2F2); // Red color
        borderColor = const Color(0xffBF1616); // Dark red color
        textColor = const Color(0xffBF1616); // Dark red color
        statusText = 'Ditolak';
        statusCard = 'Ditolak';
        statusRespond = 'Permintaan Anda Ditolak oleh Admin';
        detailDesc =
            'Program tidak sesuai dengan kriteria dan informasi belum lengkap. Pertimbangan kebijakan internal juga menjadi alasan penolakan.';
        break;
    }
    return {
      'containerColor': containerColor,
      'statusCard': statusCard,
      'borderColor': borderColor,
      'textColor': textColor,
      'statusText': statusText,
      'statusRespond': statusRespond,
      'detailDesc': detailDesc
    };
  }
}