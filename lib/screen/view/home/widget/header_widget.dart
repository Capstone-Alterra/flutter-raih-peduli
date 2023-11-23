import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5,
      color: AppTheme.secondaryColor,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            bottom: 20,
            child: Image.asset(
              'assets/home_bg.png',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: AppTheme.secondaryColor,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Bersama-sama Kita Membantu\nMari Berikan Bantuan Anda.',
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Aksi ketika tombol "Donasi Sekarang" ditekan
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: const Text(
                    'Donasi Sekarang',
                    style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Helvetica', 
                    fontSize: 16, 
                    fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
