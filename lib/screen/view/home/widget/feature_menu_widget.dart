import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/access_volunteer/access_volunteer_screen.dart';

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
        GestureDetector(
          onTap: () {
            print("Button Pressed: $title");
            onPressed();
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
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
            assetImage: 'assets/icons/donation.png',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return AccessVolunteerScreen();
                }),
              );
            },
          ),
          FeatureMenuItem(
            title: 'Volunteer',
            assetImage: 'assets/icons/volunteer.png',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return AccessVolunteerScreen();
                }),
              );
            },
          ),
          FeatureMenuItem(
            title: 'Berita',
            assetImage: 'assets/icons/news.png',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return AccessVolunteerScreen();
                }),
              );
            },
          ),
          FeatureMenuItem(
            title: 'Tentang Kami',
            assetImage: 'assets/icons/about.png',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return AccessVolunteerScreen();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
