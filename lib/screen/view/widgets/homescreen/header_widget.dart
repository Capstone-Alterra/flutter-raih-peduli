import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/fundraise_screen.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/svg.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: mediaQuery.width,
      height: mediaQuery.height / 5,
      color: AppTheme.secondaryColor,
      child: Stack(
        children: [
          Positioned(
            top: mediaQuery.height / 20,
            right: 0,
            child: SvgPicture.asset(
              'assets/home_bg.svg',
              height: mediaQuery.width / 4,
              width: mediaQuery.width / 4,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.33,
            color: AppTheme.secondaryColor,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: mediaQuery.height / 42),
                Text(
                  'Bersama-sama Kita Membantu\nMari Berikan Bantuan Anda.',
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: mediaQuery.width / 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FundraiseScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: mediaQuery.height / 27,
                    width: mediaQuery.width / 3,
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15.0,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Donasi Sekarang',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Helvetica',
                          fontSize: mediaQuery.width / 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
