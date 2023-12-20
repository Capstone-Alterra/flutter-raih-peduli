import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_historycreatevolunteer.dart';
import 'package:flutter_raih_peduli/services/service_historycreatevolunteer.dart';
import 'package:intl/intl.dart';

class HistoryCreateVolunteerViewModel extends ChangeNotifier {
  HistoryCreateVolunteerModel? historyCreateVolunteerModel;
  final services = HistoryCreateVolunteerServices();

  bool isLoading = true;

  Future<void> getHistoryCreateVolunteer({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      isLoading = true;
      historyCreateVolunteerModel =
          await services.fetchhistorycreatefundraise(token: accessToken);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = true;
      historyCreateVolunteerModel =
          await services.fetchhistorycreatefundraise(token: refreshToken);
      isLoading = false;
      if (e is DioException) {
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }

  String formattedPrice(price) => NumberFormat.currency(
        locale: 'id_ID', // This sets the currency format for Indonesian Rupiah
        symbol: 'Rp. ', // Currency symbol
        decimalDigits: 0, // Number of decimal places
      ).format(int.parse(price));

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
