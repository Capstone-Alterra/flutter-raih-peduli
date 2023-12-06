// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/forget_password/verifikasi_otp_forget_password.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/login_signup/button.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/login_signup/textformfield.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_forget_password.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  @override
  Widget build(BuildContext context) {

    final viewModel =
        Provider.of<ForgetPasswordViewModel>(context, listen: false);
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
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  color: Colors.white,
                                  Icons.arrow_back,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
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
                                'Lupa Kata Sandi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Silakan Masukkan Alamat Email Anda untuk Menerima Kode Verifikasi',
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
                  top: heightMediaQuery / 2.9,
                  left: widthMediaQuery / 15,
                  right: widthMediaQuery / 15,
                  child: Container(
                    height: heightMediaQuery / 5,
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
                        child: Form(
                          key: viewModel.formKeyEmailForgetPassword,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customTextFormField(
                                  controller: viewModel.email,
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Color(0xFF484F88),
                                    size: 18,
                                  ),
                                  labelText: "Email",
                                  validator: (value) =>
                                      viewModel.validateEmail(value!)),
                              customButton(
                                text: "Kirim",
                                bgColor: const Color(0xFF484F88),
                                onPressed: () async {
                                  if (viewModel
                                      .formKeyEmailForgetPassword.currentState!
                                      .validate()) {
                                    await viewModel.getOtpViaEmail();
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const VerifikasiForgetPassword(),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
