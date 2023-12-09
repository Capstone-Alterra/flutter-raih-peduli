// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/login_signup/alert.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_ganti_password.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

import '../../view_model/view_model_signin.dart';
import '../widgets/login_signup/button.dart';
import 'sukses_ganti_kata_sandi.dart';

class GantiPassword extends StatelessWidget {
  const GantiPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final sp = Provider.of<SignInViewModel>(context, listen: false);
    final accessToken = sp.accessTokenSharedPreference;
    final refreshToken = sp.refreshTokenSharedPreference;
    final viewModel =
        Provider.of<GantiPasswordViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Kata Sandi Baru',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Helvetica',
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer<GantiPasswordViewModel>(
            builder: (context, contactModel, child) {
              return Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: viewModel.passwordLama,
                      obscureText: !viewModel.isPasswordVisiblePasswordLama,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Masukan Kata Sandi Lama",
                        hintStyle: const TextStyle(
                          color: Color(0xFFB0B0B0),
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.blueGrey,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.isPasswordVisiblePasswordLama
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xFF484F88),
                          ),
                          onPressed: () {
                            viewModel.togglePasswordVisibilityPasswordLama();
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      validator: (value) =>
                          viewModel.validatePasswordLama(value!),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: viewModel.passwordBaru,
                      obscureText: !viewModel.isPasswordVisiblePasswordBaru,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Masukan Kata Sandi Baru",
                        hintStyle: const TextStyle(
                          color: Color(0xFFB0B0B0),
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.blueGrey,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.isPasswordVisiblePasswordBaru
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xFF484F88),
                          ),
                          onPressed: () {
                            viewModel.togglePasswordVisibilityPasswordBaru();
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      validator: (value) =>
                          viewModel.validatePasswordBaru(value!),
                    ),
                    const SizedBox(height: 15),
                    customButton(
                      text: "Lanjut",
                      bgColor: const Color(0xFF484F88),
                      onPressed: () async {
                        if (viewModel.formKey.currentState!.validate()) {
                          await viewModel.fetchOldPassword(
                            accessToken: accessToken,
                            refreshToken: refreshToken,
                          );
                          if (viewModel.isGagalCheckPasswordLama != false) {
                            await viewModel.fetchNewPassword(
                              accessToken: accessToken,
                              refreshToken: refreshToken,
                            );
                            if (viewModel.isGagalChangePassword != false) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SuksesGantiKataSandi(),
                                ),
                              );
                              viewModel.passwordLama.clear();
                              viewModel.passwordBaru.clear();
                            } else {
                              customAlert(
                                context: context,
                                alertType: QuickAlertType.error,
                                text: 'Kata sandi Gagal diubah',
                              );
                            }
                          } else {
                            customAlert(
                              context: context,
                              alertType: QuickAlertType.error,
                              text: 'Kata sandi lama anda salah',
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
