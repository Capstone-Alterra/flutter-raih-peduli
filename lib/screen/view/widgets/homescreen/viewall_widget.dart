import 'package:flutter/material.dart';

class ViewallWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const ViewallWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: const Text(
        'Lihat Semua',
        style: TextStyle(
          fontFamily: 'Helvetica',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}
