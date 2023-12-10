import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_historydonation.dart';
import 'package:flutter_raih_peduli/services/service_historydonation.dart';
import 'package:flutter_raih_peduli/utils/state/finite_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonationHistoryViewModel extends ChangeNotifier {
  HistoryDonationModel? historyDonationModel;
  final services = HistoryDonationServices();
  String accessToken = '';

  MyState myState = MyState.loading;

  Future<void> getDonationHistory() async {
    await getAccessToken();
    try {
      myState = MyState.loading;
      notifyListeners();

      historyDonationModel =
          await services.fetchHistoryDonation(token: accessToken);
      print(historyDonationModel!.data);

      myState = MyState.loaded;
      notifyListeners();

    } catch (e) {
      if (e is DioException){
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
}
