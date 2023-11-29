import 'package:flutter/material.dart';

class VolunteerFormViewModel extends ChangeNotifier {
  DateTime date1 = DateTime.now();
  DateTime get dueDate1 => date1;
  DateTime date2 = DateTime.now();
  DateTime get dueDate2 => date2;

  set dueDate1(DateTime value) {
    date1 = value;
    notifyListeners();
  }

  void setDate1(BuildContext context) async {
    final selectedDate1 = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );

    if (selectedDate1 == null) return;

    date1 = selectedDate1;
    notifyListeners(); // Notify listeners about the dueDate change
  }

  set dueDate2(DateTime value) {
    date2 = value;
    notifyListeners();
  }

  void setDate2(BuildContext context) async {
    final selectedDate2 = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );

    if (selectedDate2 == null) return;

    date2 = selectedDate2;
    notifyListeners(); // Notify listeners about the dueDate change
  }
}
