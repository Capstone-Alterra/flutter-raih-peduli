import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_historyapplyvolunteer.dart';
import 'package:flutter_raih_peduli/services/service_historyapplyvolunteer.dart';
import 'package:flutter_raih_peduli/utils/state/finite_state.dart';
import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class HistoryApplyVolunteerViewModel extends ChangeNotifier {
  HistoryApplyVolunteerModel? historyApplyVolunteerModel;
  final services = HistoryApplyVolunteerServices();
  // String accessToken = '';

  MyState myState = MyState.loading;

  Future<void> getHistoryApplyVolunteer({
    required String accessToken,
    required String refreshToken,
  }) async {
    // await getAccessToken();
    try {
      myState = MyState.loading;
      notifyListeners();

      historyApplyVolunteerModel = await services.fetchHistoryApplyVolunteer(
        token: accessToken,
      );

      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      historyApplyVolunteerModel = await services.fetchHistoryApplyVolunteer(
        token: refreshToken,
      );
      if (e is DioException) {
        e.response!.statusCode;
      }

      myState = MyState.failed;
      notifyListeners();
    }
  }

  // Future<void> getAccessToken() async {
  //   final getAccToken = await SharedPreferences.getInstance();
  //   accessToken = getAccToken.getString('access_token')!;
  // }

  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd-MM-y');
    return formatter.format(dateTime);
  }

  Map<String, dynamic> getColorStatus(String status) {
    Color containerColor = const Color(0xffEFFAF4);
    Color borderColor = const Color(0xff166648);
    Color textColor = const Color(0xff166648);
    String statusText = '';
    String statusCard = '';
    String detailDesc = '';
    String statusRespond = '';
    switch (status) {
      case 'accepted':
        containerColor = const Color(0xffEFFAF4); // Green color
        borderColor = const Color(0xff166648); // Dark green color
        textColor = const Color(0xff166648); // Dark green color
        statusText = 'Diterima';
        statusCard = 'Diterima';
        statusRespond = 'Selamat Kamu Diterima Menjadi Relawan';
        detailDesc =
            'Selamat!! Permohonan Program Relawan telah berhasil diterima';
        break;
      case 'pending':
        containerColor = const Color(0xffFFFDEA); // Yellow color
        borderColor = const Color(0xffBB5902); // Dark yellow color
        textColor = const Color(0xffBB5902); // Dark yellow color
        statusText = 'Pending';
        statusCard = 'Pending (Menunggu Review Admin)';
        detailDesc =
            'Mohon Tunggu 2-3 Hari Bagi Kami Untuk Memproses Permintaan Anda';
        statusRespond = 'Kami Telah Menerima Permintaan Anda';
        break;
      default:
        containerColor = const Color(0xffFEF2F2); // Red color
        borderColor = const Color(0xffBF1616); // Dark red color
        textColor = const Color(0xffBF1616); // Dark red color
        statusText = 'Ditolak';
        statusCard = 'Mohon Maaf, Kamu Belum Diterima Menjadi Relawan';
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
