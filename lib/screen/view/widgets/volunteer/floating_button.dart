import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class CustomFloatingButton extends StatefulWidget {
  @override
  _CustomFloatingButtonState createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final overlayProvider = Provider.of<VolunteerViewModel>(context);

    return Stack(
      children: [
        // Overlay
        if (overlayProvider.isOverlayVisible)
          Padding(
            padding:
                EdgeInsets.only(top: size.height / 1.4, left: size.width / 3),
            child: Column(
              children: [
                // Button 1: Buat Request Donasi
                Container(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Text(
                        'Buat Request Donasi',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: size.height / 50,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: size.height / 13,
                          height: size.height / 13,
                          decoration: const BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                8.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/donate.svg',
                              height: size.height / 25,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 10.0),

                // Button 2: Buat Request Relawan
                Container(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Text(
                        'Buat Request Relawan',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: size.height / 50,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: size.height / 13,
                          height: size.height / 13,
                          decoration: const BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                8.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/tangan_create_volunteer.svg',
                              height: size.height / 25,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

        // Main Floating Button
        Positioned(
          right: 0,
          bottom: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              overlayProvider.toggleOverlay();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: overlayProvider.isOverlayVisible
                ? Colors.white
                : AppTheme.primaryColor,
            child: Icon(
              overlayProvider.isOverlayVisible ? Icons.close : Icons.add,
              color: overlayProvider.isOverlayVisible
                  ? AppTheme.primaryColor
                  : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
