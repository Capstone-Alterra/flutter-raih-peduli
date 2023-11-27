import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme/theme.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      padding: const EdgeInsets.all(6.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        color: AppTheme.ornamentColor,
      ),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppTheme.primaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
