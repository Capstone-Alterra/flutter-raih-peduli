import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_historyapplyvolunteer.dart';
import 'package:flutter_raih_peduli/services/service_historyapplyvolunteer.dart';
import 'package:flutter_raih_peduli/utils/state/finite_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryApplyVolunteerViewModel extends ChangeNotifier {
  HistoryApplyVolunteerModel? historyApplyVolunteerModel;
  final services = HistoryApplyVolunteerServices();
  String accessToken = '';
  String statusText = '';

  MyState myState = MyState.loading;
  

  Color containerColor = const Color(0xffEFFAF4);
  Color borderColor = const Color(0xff166648);
  Color textColor = const Color(0xff166648);

  Future<void> getHistoryApplyVolunteer() async {
    await getAccessToken();
    try {
      myState = MyState.loading;
      notifyListeners();

      historyApplyVolunteerModel = await services.fetchHistoryApplyVolunteer(token: accessToken);

      if (historyApplyVolunteerModel != null &&
          historyApplyVolunteerModel!.data.isNotEmpty) {
        String status = historyApplyVolunteerModel!.data.first.status;
        switch (status) {
          case 'accepted':
            containerColor = const Color(0xffEFFAF4); // Green color
            borderColor = const Color(0xff166648); // Dark green color
            textColor = const Color(0xff166648); // Dark green color
            statusText = 'Diterima';
            break;
          case 'pending':
            containerColor = const Color(0xffFFFDEA); // Yellow color
            borderColor = const Color(0xffBB5902); // Dark yellow color
            textColor = const Color(0xffBB5902); // Dark yellow color
            statusText = 'Pending';
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
}
