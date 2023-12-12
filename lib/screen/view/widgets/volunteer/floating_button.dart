// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/create_fundraise/create_fundraise_screen.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

import '../login_signup/alert.dart';

class CustomFloatingButton extends StatefulWidget {
  const CustomFloatingButton({super.key});

  @override
  _CustomFloatingButtonState createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  late VolunteerViewModel overlayProvider;
  late SignInViewModel sp;
  @override
  void initState() {
    overlayProvider = Provider.of<VolunteerViewModel>(context, listen: false);
    sp = Provider.of<SignInViewModel>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<VolunteerViewModel>(
      builder: (context, contactModel, child) {
        return Stack(
          children: [
            // Overlay
            if (overlayProvider.isOverlayVisible)
              Padding(
                padding: EdgeInsets.only(
                    top: size.height / 1.25, left: size.width / 3),
                child: Column(
                  children: [
                    // Container(
                    //   padding: const EdgeInsets.only(left: 16.0),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         'Buat Request Relawan',
                    //         style: TextStyle(
                    //           fontFamily: 'Helvetica',
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.white,
                    //           fontSize: size.height / 50,
                    //         ),
                    //       ),
                    //       const Spacer(),
                    //       GestureDetector(
                    //         onTap: () {},
                    //         child: Container(
                    //           width: size.height / 13,
                    //           height: size.height / 13,
                    //           decoration: const BoxDecoration(
                    //             color: AppTheme.primaryColor,
                    //             borderRadius: BorderRadius.all(
                    //               Radius.circular(
                    //                 8.0,
                    //               ),
                    //             ),
                    //           ),
                    //           child: Center(
                    //             child: SvgPicture.asset(
                    //               'assets/tangan_create_volunteer.svg',
                    //               height: size.height / 25,
                    //             ),
                    //           ),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(height: 10.0),
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
                            onTap: () {
                              if (sp.isSudahLogin == false) {
                                customAlert(
                                  context: context,
                                  alertType: QuickAlertType.error,
                                  text: 'Anda belum melakukan login',
                                  afterDelay: () {
                                    Navigator.pop(context);
                                  },
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateFundraise(),
                                  ),
                                );
                                overlayProvider.overlay();
                              }
                            },
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
      },
    );
  }
}
