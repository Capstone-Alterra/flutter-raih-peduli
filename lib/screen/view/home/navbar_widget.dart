import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  BottomNavigationBarWidget({
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        onItemTapped(index);
      },
      showSelectedLabels: true, // Menampilkan label item yang terpilih
      showUnselectedLabels: true, // Menampilkan label item yang tidak terpilih
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/home.png'),
            color: AppTheme.primaryColor,
          ),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/chatbot.png'),
            color: AppTheme.primaryColor,
          ),
          label: 'Chatbot',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/history.png'),
            color: AppTheme.primaryColor,
          ),
          label: 'Riwayat',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/settings.png'),
            color: AppTheme.primaryColor,
          ),
          label: 'Pengaturan',
        ),
      ],
    );
  }
}
