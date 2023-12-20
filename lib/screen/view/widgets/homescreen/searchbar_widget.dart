// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/fundraise_screen.dart';
import 'package:flutter_raih_peduli/screen/view/news/news_page.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/access_volunteer_screen.dart';
import 'package:flutter_raih_peduli/theme.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 14, 0, 14),
      child: InkWell(
        onTap: () {
          _showDropdown(context);
        },
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(25.0),
              right: Radius.circular(25.0),
            ),
          ),
          child: Row(
            children: [
              Image.asset('assets/search.png'),
              const SizedBox(width: 10),
              const Text(
                'Cari...',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Helvetica',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDropdown(BuildContext context) async {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset(0.0, size.height));

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        10,
        offset.dy,
        10 + size.width,
        offset.dy + 300,
      ),
      items: [
        _buildPopupMenuItem('Donasi', () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FundraiseScreen(),
            ),
          );
        }),
        _buildPopupMenuItem('Relawan', () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AccessVolunteerScreen(),
            ),
          );
        }),
        _buildPopupMenuItem('Berita', () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewsPage(),
            ),
          );
        }),
      ],
      elevation: 8.0,
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title, VoidCallback onTap) {
    return PopupMenuItem(
      onTap: onTap,
      child: SizedBox(
        width: 200, 
        child: Text(
          title,
          style: const TextStyle(
            color: AppTheme.primaryColor,
            fontFamily: 'Helvetica',
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
