// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/masuk_atau_daftar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/model_onboarding.dart';
import '../view/onboarding/onboarding_view.dart';

class OnBoardingViewModel with ChangeNotifier {
  int currentIndex = 0;
  late PageController controller = PageController(initialPage: 0);
  late SharedPreferences pernahDownload;
  late bool newApk;

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

  void checkDownload(BuildContext context) async {
    pernahDownload = await SharedPreferences.getInstance();
    newApk = pernahDownload.getBool('download') ?? true;

    if (newApk == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginAtauDaftar(),
          ),
          (route) => false);
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const Onbording(),
              ),
              (route) => false);
        },
      );
    }
  }
}
