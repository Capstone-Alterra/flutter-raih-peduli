// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/forget_password/ubah_password.dart';
import 'package:quickalert/quickalert.dart';

Future customAlert({
  required BuildContext context,
  required QuickAlertType alertType,
  String? customAsset,
  String? text,
  required bool shouldPop,
}) async {
  QuickAlert.show(
    showCancelBtn: false,
    showConfirmBtn: false,
    animType: QuickAlertAnimType.slideInDown,
    backgroundColor: Colors.white,
    context: context,
    type: alertType,
    customAsset: customAsset,
    text: text,
    widget: const SizedBox(),
  );
  await Future.delayed(const Duration(seconds: 4));
  shouldPop
      ? Navigator.pop(context)
      : Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const UbahPassword(),
          ),
        );
}
