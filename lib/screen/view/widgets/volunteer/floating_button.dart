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
    final overlayProvider = Provider.of<VolunteerViewModel>(context);

    return Stack(
      children: [
        // Overlay
        if (overlayProvider.isOverlayVisible)
          Padding(
            padding: const EdgeInsets.only(top: 600.0, left: 140),
            child: Column(
              children: [
                // Button 1: Buat Request Donasi
                Container(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Buat Request Donasi',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          // Handle action for Buat Request Donasi
                          overlayProvider.toggleOverlay();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: AppTheme.primaryColor,
                          padding: const EdgeInsets.all(16.0),
                        ),
                        child: SvgPicture.asset(
                          'assets/donate.svg', // Gantilah dengan path SVG yang sesuai
                          height: 24.0, // Sesuaikan dengan kebutuhan
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10.0),

                // Button 2: Buat Request Relawan
                Container(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Buat Request Relawan',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          // Handle action for Buat Request Relawan
                          
                          overlayProvider.toggleOverlay();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: AppTheme.primaryColor,
                          padding: const EdgeInsets.all(16.0),
                        ),
                        child: SvgPicture.asset(
                          'assets/volunteer.svg', // Gantilah dengan path SVG yang sesuai
                          height: 24.0, // Sesuaikan dengan kebutuhan
                        ),
                      ),
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
