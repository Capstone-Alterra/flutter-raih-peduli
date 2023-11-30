import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/fundraising_data.dart';
import 'package:flutter_raih_peduli/model/volunteer_data.dart';

class BookmarkScreenViewModel extends ChangeNotifier {
  List<FundraisingData> fundraisingList = dummyFundraisingData;
  List<VolunteerData> volunteerList = dummyVolunteerData;

  List<dynamic> get filteredList => _filteredList;

  String _selectedFilter = 'Semua';
  List<dynamic> _filteredList = List<dynamic>.from(dummyFundraisingData)
  ..addAll(dummyVolunteerData);


  String get selectedFilter => _selectedFilter;

  void setFilter(String filter) {
    _selectedFilter = filter;
    _updateFilteredList();
    notifyListeners();
  }

  void _updateFilteredList() {
    if (_selectedFilter == 'Semua') {
      _filteredList = [...fundraisingList, ...volunteerList];
    } else if (_selectedFilter == 'Donasi') {
      _filteredList = [...fundraisingList];
    } else if (_selectedFilter == 'Relawan') {
      _filteredList = [...volunteerList];
    }
  }
}
