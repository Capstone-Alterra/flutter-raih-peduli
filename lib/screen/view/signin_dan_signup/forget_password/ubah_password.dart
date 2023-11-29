// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/login_signup/alert.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/login_signup/button.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/login_signup/textformfield.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_forget_password.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import '../sign_in.dart';

class UbahPassword extends StatefulWidget {
  const UbahPassword({super.key});

  @override
  State<UbahPassword> createState() => _UbahPasswordState();
}

class _UbahPasswordState extends State<UbahPassword> {
  late ForgetPasswordViewModel viewModel;
  @override
  void initState() {
    viewModel = Provider.of<ForgetPasswordViewModel>(context, listen: false);
    viewModel.setUlang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: widthMediaQuery,
            height: heightMediaQuery - (heightMediaQuery * 0.05),
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: heightMediaQuery / 2.5,
                    width: widthMediaQuery,
                    decoration: const BoxDecoration(
                        color: Color(0xFF293066),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    child: Column(
                      children: [
                        Container(
                          height: heightMediaQuery * 0.075,
                          color: const Color(0xFF293066),
                        ),
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
                                'Kata Sandi Baru',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Kata Sandi Baru harus berbeda dari kata sandi sebelumnya.',
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
                  top: heightMediaQuery / 3,
                  left: widthMediaQuery / 15,
                  right: widthMediaQuery / 15,
                  child: Consumer<ForgetPasswordViewModel>(
                    builder: (context, contactModel, child) {
                      return Container(
                        height: viewModel.heightContainer
                            ? heightMediaQuery / 3
                            : heightMediaQuery / 3.75,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Consumer<ForgetPasswordViewModel>(
                                  builder: (context, contactModel, child) {
                                    return Form(
                                      key: viewModel.formKeyUbahPassword,
                                      child: Column(
                                        children: [
                                          customTextFormField(
                                              controller: viewModel.password,
                                              prefixIcon: Image.asset(
                                                "assets/lock.png",
                                              ),
                                              labelText: "Password",
                                              obscureText: true,
                                              validator: (value) => viewModel
                                                  .validatePasswordBaru(
                                                      value!)),
                                          const SizedBox(height: 5),
                                          customTextFormField(
                                              controller:
                                                  viewModel.konfirmasiPassword,
                                              prefixIcon: Image.asset(
                                                "assets/lock.png",
                                              ),
                                              labelText: "Password",
                                              obscureText: true,
                                              validator: (value) => viewModel
                                                  .validateKonfirmasiPassword(
                                                      value!)),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                customButton(
                                  text: "Simpan",
                                  bgColor: const Color(0xFF484F88),
                                  onPressed: () async {
                                    if (viewModel
                                        .formKeyUbahPassword.currentState!
                                        .validate()) {
                                      final token =
                                          viewModel.dataOtp!.accessToken;
                                      await viewModel.ubahPassword(token);
                                      customAlert(
                                        context: context,
                                        alertType: QuickAlertType.custom,
                                        customAsset:
                                            'assets/Group 427318233.png',
                                        text: 'Password Berhasil Diperbarui',
                                        afterDelay: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => const SignIn(),
                                              ),
                                              (route) => false);
                                        },
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
