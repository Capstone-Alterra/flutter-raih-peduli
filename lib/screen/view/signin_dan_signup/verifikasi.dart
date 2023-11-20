// import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/sign_in.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signup.dart';
import 'package:provider/provider.dart';

class Verifikasi extends StatelessWidget {
  const Verifikasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignUpViewModel>(context, listen: false);
    final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;
    double appBarHeight = AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: widthMediaQuery,
              height: heightMediaQuery - appBarHeight - 70,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: heightMediaQuery / 3,
                      width: widthMediaQuery,
                      decoration: const BoxDecoration(
                          color: Color(0xFF293066),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/raih_peduli_tanpa_huruf.png",
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'OTP Registrasi',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Silahkan Masukkan 6 Digit Kode yang dikirim ke Alamat Email Anda',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: heightMediaQuery / 3.5,
                    left: widthMediaQuery / 15,
                    right: widthMediaQuery / 15,
                    height: heightMediaQuery / 2.6,
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
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Consumer<SignUpViewModel>(
                                builder: (context, contactModel, child) {
                                  return OtpTextField(
                                    margin: const EdgeInsets.only(right: 2),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(7.0)),
                                    filled: true,
                                    numberOfFields: 6,
                                    focusedBorderColor: const Color(0xFF484F88),
                                    showFieldAsBox: true,
                                    borderWidth: 2.0,
                                    onCodeChanged: (String code) {},
                                    onSubmit: (String verificationCode) {
                                      viewModel.kodeOtp = verificationCode;
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                              Center(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Tidak menerima kode? ',
                                        style: TextStyle(
                                            color: Color(0xFF293066),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13),
                                      ),
                                      TextSpan(
                                        text: 'Kirim ulang',
                                        style: const TextStyle(
                                          color: Color(0xFF8CA2CE),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            print("coba");
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF484F88),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  debugPrint("=>${viewModel.kodeOtp}");
                                  final otp = viewModel.kodeOtp;
                                  viewModel.verifikasi(otp);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const SignIn(),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                    width: widthMediaQuery,
                                    child: const Center(
                                        child: Text("Verifikasi"))),
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
                          fontWeight: FontWeight.w500),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
