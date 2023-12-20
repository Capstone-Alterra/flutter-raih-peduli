// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/navigation/navigation.dart';
import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/sign_in.dart';
import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/sign_up.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:provider/provider.dart';

class LoginAtauDaftar extends StatelessWidget {
  const LoginAtauDaftar({super.key});

  @override
  Widget build(BuildContext context) {
    final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;
    final viewModel = Provider.of<SignInViewModel>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: widthMediaQuery,
            height: heightMediaQuery - 40,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: heightMediaQuery / 2.15,
                    width: widthMediaQuery,
                    decoration: const BoxDecoration(
                        color: Color(0xFF293066),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0))),
                    child: Center(
                      child: Image.asset(
                        "assets/raih_peduli_putih.png",
                        width: 120.0,
                        height: 120.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: heightMediaQuery / 2.5,
                  left: widthMediaQuery / 15,
                  right: widthMediaQuery / 15,
                  height: heightMediaQuery / 3.5,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFE5E9F4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          8.0,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    'Selamat Datang di Raih Peduli',
                                    style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Raih keberkahan dengan kepedulian',
                                    style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff293066),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const SignIn(),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: widthMediaQuery,
                                    child: const Center(
                                      child: Text(
                                        "Masuk",
                                        style: TextStyle(
                                          fontFamily: 'Helvetica',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: heightMediaQuery / 70),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE5E9F4),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: const BorderSide(
                                          color: Color(0xff293066), width: 1),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const SignUp(),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: widthMediaQuery,
                                    child: const Center(
                                      child: Text(
                                        "Daftar",
                                        style: TextStyle(
                                          fontFamily: 'Helvetica',
                                          color: Color(0xff293066),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Masuk sebagai tamu',
                    style: const TextStyle(
                        color: Color(0xFF293066),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Helvetica'),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                       await viewModel.keluar();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const BottomNavgationBarWidget(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
