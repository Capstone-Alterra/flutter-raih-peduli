import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/masuk_atau_daftar.dart';
import '../../model/model_onboarding.dart';

class OnBoardingViewModel with ChangeNotifier {
  int currentIndex = 0;
  late PageController controller = PageController(initialPage: 0);

  void updateIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

  bool isLastPage() {
    return currentIndex == contents.length - 1;
  }

  void nextPage(PageController controller) {
    controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void skipPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginAtauDaftar(),
      ),
    );
  }
}
