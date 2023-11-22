// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/verifikasi.dart';
import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/widget/textformfield.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signup.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignUpViewModel>(context, listen: false);
    final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
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
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Daftar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Daftar, untuk dapat berkontribusi membantu sesama manusia.',
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
                      top: heightMediaQuery / 3.25,
                      left: widthMediaQuery / 15,
                      right: widthMediaQuery / 15,
                      height: heightMediaQuery / 1.675,
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
                                customTextFormField(
                                  controller: viewModel.fullname,
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Color(0xFF484F88),
                                    size: 18,
                                  ),
                                  labelText: "Nama Lengkap",
                                ),
                                const SizedBox(height: 5),
                                customTextFormField(
                                  controller: viewModel.email,
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Color(0xFF484F88),
                                    size: 18,
                                  ),
                                  labelText: "Email",
                                ),
                                const SizedBox(height: 5),
                                customTextFormField(
                                  controller: viewModel.address,
                                  prefixIcon: const Icon(
                                    Icons.home,
                                    color: Color(0xFF484F88),
                                    size: 18,
                                  ),
                                  labelText: "Alamat",
                                ),
                                const SizedBox(height: 5),
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: '',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 8),
                                      prefixIcon: Image.asset(
                                        "assets/2 User.png",
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      border: InputBorder.none),
                                  value: viewModel.selectedGender,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 15,
                                  elevation: 160,
                                  style: const TextStyle(color: Colors.black),
                                  items: viewModel.genderList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: viewModel.onGenderChanged,
                                ),
                                const SizedBox(height: 5),
                                customTextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: viewModel.phone,
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    color: Color(0xFF484F88),
                                    size: 18,
                                  ),
                                  labelText: "No. Handphone",
                                ),
                                const SizedBox(height: 5),
                                customTextFormField(
                                    controller: viewModel.password,
                                    prefixIcon: Image.asset(
                                      "assets/lock_password.png",
                                      width: 10.0,
                                      height: 10.0,
                                    ),
                                    labelText: "Password",
                                    obscureText: true),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {},
                                    ),
                                    const Text(
                                      'Saya setuju dengan Kebijakan Privasi Raih Peduli',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF484F88),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () async {
                                    await viewModel.signUp();
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Verifikasi(),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                      width: widthMediaQuery,
                                      child:
                                          const Center(child: Text("Daftar"))),
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
      ),
    );
  }
}
