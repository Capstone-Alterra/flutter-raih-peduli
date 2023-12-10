import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_historycreatefundrise.dart';
import 'package:flutter_raih_peduli/services/service_historycreatefundrise.dart';
import 'package:flutter_raih_peduli/utils/state/finite_state.dart';

class CreateFundriseViewModel extends ChangeNotifier {
  MyState myState = MyState.loading;
  HistoryCreateFundrise? historyCreateFundrise;
  final services = HistoryCreateFundriseServices();

  Future<void> getCreateFundriseHistory({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      myState = MyState.loading;
      notifyListeners();
      historyCreateFundrise =
          await services.fetchHistoryCreateFundrise(token: accessToken);
      print(historyCreateFundrise!.data);
      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        myState = MyState.loading;
        notifyListeners();
        historyCreateFundrise =
            await services.fetchHistoryCreateFundrise(token: refreshToken);
        myState = MyState.loaded;
        notifyListeners();
        e.response!.statusCode;
      }
    }
  }
}
