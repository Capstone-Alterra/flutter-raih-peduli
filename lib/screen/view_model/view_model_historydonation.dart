import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_historydonation.dart';
import 'package:flutter_raih_peduli/services/service_historydonation.dart';
import 'package:flutter_raih_peduli/utils/state/finite_state.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonationHistoryViewModel extends ChangeNotifier {
  HistoryDonationModel? historyDonationModel;
  final services = HistoryDonationServices();
  String accessToken = '';
  String statusText = '';

  MyState myState = MyState.loading;

  Color containerColor = const Color(0xffEFFAF4);
  Color borderColor = const Color(0xff166648);
  Color textColor = const Color(0xff166648);

  Future<void> getDonationHistory() async {
    await getAccessToken();
    try {
      myState = MyState.loading;
      notifyListeners();

      historyDonationModel =
          await services.fetchHistoryDonation(token: accessToken);

      if (historyDonationModel != null &&
          historyDonationModel!.data.isNotEmpty) {
        String status = historyDonationModel!.data.first.status;
        switch (status) {
          case 'Paid':
            containerColor = const Color(0xffEFFAF4); // Green color
            borderColor = const Color(0xff166648); // Dark green color
            textColor = const Color(0xff166648); // Dark green color
            statusText = 'Dibayar';
            break;
          case 'Waiting For Payment':
            containerColor = const Color(0xffFFFDEA); // Yellow color
            borderColor = const Color(0xffBB5902); // Dark yellow color
            textColor = const Color(0xffBB5902); // Dark yellow color
            statusText = 'Waiting For Payment';
            break;
          default:
            containerColor = const Color(0xffFEF2F2); // Red color
            borderColor = const Color(0xffBF1616); // Dark red color
            textColor = const Color(0xffBF1616); // Dark red color
            statusText = 'Ditolak';
            break;
        }
      }

      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        e.response!.statusCode;
      }

      myState = MyState.failed;
      notifyListeners();
    }
  }

  Future<void> getAccessToken() async {
    final getAccToken = await SharedPreferences.getInstance();
    accessToken = getAccToken.getString('access_token')!;
  }

  String formattedPrice(price) => NumberFormat.currency(
        locale: 'id_ID', // This sets the currency format for Indonesian Rupiah
        symbol: 'Rp. ', // Currency symbol
        decimalDigits: 0, // Number of decimal places
      ).format(int.parse(price));
}
