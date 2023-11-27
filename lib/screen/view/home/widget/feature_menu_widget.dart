import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/donate/donatescreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeatureMenuItem extends StatelessWidget {
  final String title;
  final String assetImage;
  final VoidCallback onPressed;

  const FeatureMenuItem({
    Key? key,
    required this.title,
    required this.assetImage,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
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
            child: SvgPicture.asset(
              assetImage,
              height: 40.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class FeatureMenuList extends StatelessWidget {
  const FeatureMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FeatureMenuItem(
            title: 'Donasi',
            assetImage: 'assets/icons/featuremenu/donation.svg',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DonateScreen(),
                ),
              );
            },
          ),
          FeatureMenuItem(
            title: 'Voluntir',
            assetImage: 'assets/icons/featuremenu/volunteer.svg',
            onPressed: () {
              // Handle Voluntir button pressed
            },
          ),
          FeatureMenuItem(
            title: 'Berita',
            assetImage: 'assets/icons/featuremenu/news.svg',
            onPressed: () {
              // Handle Berita button pressed
            },
          ),
          FeatureMenuItem(
            title: 'Tentang Kami',
            assetImage: 'assets/icons/featuremenu/about.svg',
            onPressed: () {
              // Handle Tentang Kami button pressed
            },
          ),
        ],
      ),
    );
  }
}
