import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_historydonation.dart';
import 'package:flutter_raih_peduli/services/service_historydonation.dart';
import 'package:flutter_raih_peduli/utils/state/finite_state.dart';
import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class DonationHistoryViewModel extends ChangeNotifier {
  HistoryDonationModel? historyDonationModel;
  final services = HistoryDonationServices();
  // String accessToken = '';

  MyState myState = MyState.loading;

  Future<void> getDonationHistory({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      historyDonationModel =
          await services.fetchHistoryDonation(token: accessToken);

      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      historyDonationModel =
          await services.fetchHistoryDonation(token: refreshToken);
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

  String formattedPrice(price) => NumberFormat.currency(
        locale: 'id_ID', // This sets the currency format for Indonesian Rupiah
        symbol: 'Rp. ', // Currency symbol
        decimalDigits: 0, // Number of decimal places
      ).format(int.parse(price));

  String formatDate(String dateString) {
    DateTime parsedDate =
        DateTime.parse(dateString); // Parse the string into DateTime object
    final DateFormat formatter =
        DateFormat('dd-MM-yyyy'); // Define your desired format
    return formatter.format(
        parsedDate); // Format DateTime object to string in desired format
  }

  Map<String, dynamic> getColorStatus(String status) {
    Color containerColor = const Color(0xffEFFAF4);
    Color borderColor = const Color(0xff166648);
    Color textColor = const Color(0xff166648);
    String statusText = '';
    String statusRespond = '';
    switch (status) {
      case "Paid":
        statusText = 'Dibayar';
        statusRespond = 'Transaksi Donasi Telah Berhasil ';
        break;
      case "Waiting For Payment":
        containerColor = const Color(0xffFFFDEA); // Yellow color
        borderColor = const Color(0xffBB5902); // Dark yellow color
        textColor = const Color(0xffBB5902); // Dark yellow color
        statusText = 'Waiting For Payment';
        statusRespond = 'Sedang Menunggu Pembayaran';
        break;
      default:
        containerColor = const Color(0xffFEF2F2); // Red color
        borderColor = const Color(0xffBF1616); // Dark red color
        textColor = const Color(0xffBF1616); // Dark red color
        statusText = 'Dibatalkan';
        statusRespond = 'Transaksi Donasi Telah Dibatalkan';
        break;
    }
    return {
      'containerColor': containerColor,
      'borderColor': borderColor,
      'textColor': textColor,
      'statusText': statusText,
      'statusRespond': statusRespond
    };
  }
}
