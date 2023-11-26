import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_onboarding.dart';
import 'package:provider/provider.dart';

Widget buildDot(int index, BuildContext context) {
  final viewModel = Provider.of<OnBoardingViewModel>(context, listen: false);

  return Container(
    height: 5,
    width: viewModel.currentIndex == index ? 20 : 20,
    margin: const EdgeInsets.only(left: 10, right: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: viewModel.currentIndex == index
            ? const Color(0xFF293066)
            : const Color(0xFF8CA2CE)),
  );
}
