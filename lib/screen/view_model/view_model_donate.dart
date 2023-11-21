import 'package:flutter/material.dart';
import '../../model/donate_data.dart';

class DonateViewModel extends ChangeNotifier {
  final List<FundraisingData> _fundraisingDataList = dummyFundraisingData;

  List<FundraisingData> get fundraisingDataList => _fundraisingDataList;

  String searchText = '';

  void setSearchText(String value) {
    searchText = value;
    notifyListeners();
  }

  List<FundraisingData> getFundraisingDataList() {
    if (searchText.isNotEmpty) {
      return _fundraisingDataList
          .where((data) => data.title.contains(searchText))
          .toList();
    } else {
      return _fundraisingDataList;
    }
  }

  FundraisingData getFundraisingDataById(int id) {
    return _fundraisingDataList.firstWhere((data) => data.id == id);
  }
}
