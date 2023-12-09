import 'package:flutter/material.dart';

class PersonalisasiViewModel with ChangeNotifier {
  List<String> selectedItems = [];

  void toggleSelection(String item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
    notifyListeners();
  }

  bool isItemSelected(String item) {
    return selectedItems.contains(item);
  }
}
