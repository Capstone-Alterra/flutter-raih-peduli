// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/masuk_atau_daftar.dart';
import 'package:flutter_svg/svg.dart';

class SuksesGantiKataSandi extends StatelessWidget {
  const SuksesGantiKataSandi({super.key});

  @override
  Widget build(BuildContext context) {
    final heightMediaQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SvgPicture.asset("assets/sukses_ganti_password.svg"),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginAtauDaftar(),
              ),
              (route) => false);
        },
        child: SizedBox(
          width: double.infinity,
          height: heightMediaQuery / 15,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF293066),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    7.0,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'Masuk ke Raih Peduli',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Helvetica',
                    fontSize: heightMediaQuery / 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
