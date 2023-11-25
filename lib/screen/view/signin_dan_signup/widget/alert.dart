// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

Future customAlert({
  required BuildContext context,
  required QuickAlertType alertType,
  String? customAsset,
  String? text,
  VoidCallback? afterDelay,
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
  if (afterDelay != null) {
    afterDelay();
  }
}
