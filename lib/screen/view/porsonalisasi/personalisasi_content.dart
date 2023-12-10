import 'package:flutter/material.dart';

class PersonalisasiContent extends StatelessWidget {
  final String title;
  final String assetImage;
  final VoidCallback onPressed;
  final Color color;

  const PersonalisasiContent({
    super.key,
    required this.title,
    required this.assetImage,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.grey),
            ),
            child: Image.asset(
              assetImage,
              height: 40.0,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          title,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
