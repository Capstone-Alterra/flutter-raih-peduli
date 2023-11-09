import 'package:flutter/material.dart';
import '../../model/model_onboarding.dart';

class OnBoardingViewModel with ChangeNotifier {
  int currentIndex = 0;

  void updateIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

  bool isLastPage() {
    return currentIndex == contents.length - 1;
  }

  void nextPage(PageController controller) {
    controller.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
  }
}
