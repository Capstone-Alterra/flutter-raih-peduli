import 'package:flutter/material.dart';

class ViewallWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const ViewallWidget({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        'Lihat Semua',
        style: TextStyle(
          fontFamily: 'Helvetica',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
