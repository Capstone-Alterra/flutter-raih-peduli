import 'package:flutter/material.dart';

class FeatureMenuItem extends StatelessWidget {
  final String title;
  final String assetImage;
  final VoidCallback onPressed;

  const FeatureMenuItem({
    required this.title,
    required this.assetImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Image.asset(
            assetImage,
            height: 40.0, // Sesuaikan dengan ukuran yang diinginkan
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

class FeatureMenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: FeatureMenuItem(
              title: 'Donasi',
              assetImage: 'assets/icons/donation.png',
              onPressed: () {
                // Handle Donasi button pressed
              },
            ),
          ),
          Expanded(
            child: FeatureMenuItem(
              title: 'Voluntir',
              assetImage: 'assets/icons/volunteer.png',
              onPressed: () {
                // Handle Voluntir button pressed
              },
            ),
          ),
          Expanded(
            child: FeatureMenuItem(
              title: 'Berita',
              assetImage: 'assets/icons/news.png',
              onPressed: () {
                // Handle Berita button pressed
              },
            ),
          ),
          Expanded(
            child: FeatureMenuItem(
              title: 'Tentang Kami',
              assetImage: 'assets/icons/about.png',
              onPressed: () {
                // Handle Tentang Kami button pressed
              },
            ),
          ),
        ],
      ),
    );
  }
}
