// ignore_for_file: use_build_context_synchronously
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/verifikasi.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/login_signup/button.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/login_signup/textformfield.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signup.dart';
import 'package:provider/provider.dart';
import '../navigation/navigation.dart';

double getAppBarHeight(BuildContext context) {
  return MediaQuery.of(context).padding.top + kToolbarHeight;
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late SignUpViewModel viewModel;
  @override
  void initState() {
    viewModel = Provider.of<SignUpViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = getAppBarHeight(context);
    final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: widthMediaQuery,
          height: heightMediaQuery - appBarHeight,
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
                      Center(
                        child: Image.asset(
                          "assets/raih_peduli_tanpa_huruf.png",
                          width: 90,
                          height: 90,
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
                                fontFamily: 'Helvetica',
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Daftar, untuk dapat berkontribusi membantu sesama manusia.',
                              style: TextStyle(
                                fontFamily: 'Helvetica',
                                color: Colors.white,
                                fontSize: 13,
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
                top: heightMediaQuery / 4.75,
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
                  child: SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Form(
                          key: viewModel.formKey,
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
                                  validator: (value) =>
                                      viewModel.validateName(value!)),
                              const SizedBox(height: 5),
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
                              const SizedBox(height: 5),
                              customTextFormField(
                                controller: viewModel.address,
                                prefixIcon: const Icon(
                                  Icons.home,
                                  color: Color(0xFF484F88),
                                  size: 18,
                                ),
                                labelText: "Alamat",
                                validator: (value) =>
                                    viewModel.validateAddress(value!),
                              ),
                              const SizedBox(height: 5),
                              Consumer<SignUpViewModel>(
                                builder: (context, contactModel, child) {
                                  return DropdownButtonFormField<String>(
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                    validator: (value) =>
                                        viewModel.validateGender(value!),
                                  );
                                },
                              ),
                              const SizedBox(height: 5),
                              customTextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.phone,
                                controller: viewModel.phone,
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  color: Color(0xFF484F88),
                                  size: 18,
                                ),
                                labelText: "No. Handphone",
                                validator: (value) =>
                                    viewModel.validatePhone(value!),
                              ),
                              const SizedBox(height: 5),
                              Consumer<SignUpViewModel>(
                                builder: (context, contactModel, child) {
                                  return customTextFormField(
                                    controller: viewModel.password,
                                    prefixIcon: Image.asset(
                                      "assets/lock_password.png",
                                      width: 10.0,
                                      height: 10.0,
                                    ),
                                    labelText: "Password",
                                    obscureText: !viewModel.isPasswordVisible,
                                    sufixIcon: IconButton(
                                      icon: Icon(
                                        viewModel.isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color(0xFF484F88),
                                      ),
                                      onPressed: () {
                                        viewModel.togglePasswordVisibility();
                                      },
                                    ),
                                    validator: (value) =>
                                        viewModel.validatePassword(value!),
                                  );
                                },
                              ),
                              Row(
                                children: [
                                  Consumer<SignUpViewModel>(
                                    builder: (context, viewModel, child) {
                                      return Checkbox(
                                        value: viewModel.agree,
                                        onChanged: (bool? value) {
                                          viewModel.setAgreePrivasi(value!);
                                          debugPrint("=>$value");
                                        },
                                        activeColor: viewModel.agree
                                            ? const Color(0xFF484F88)
                                            : null,
                                      );
                                    },
                                  ),
                                  const Text(
                                    'Saya setuju dengan Kebijakan Privasi Raih Peduli',
                                    style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              Consumer<SignUpViewModel>(
                                builder: (context, viewModel, child) {
                                  return viewModel.agree
                                      ? customButton(
                                          text: "Daftar",
                                          bgColor: const Color(0xFF484F88),
                                          onPressed: () async {
                                            if (viewModel.formKey.currentState!
                                                .validate()) {
                                              await viewModel.signUp();
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Verifikasi(),
                                                ),
                                              );
                                            }
                                          },
                                        )
                                      : customButton(
                                          text: "Daftar",
                                          bgColor: CupertinoColors.inactiveGray,
                                        );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: heightMediaQuery / 1.2,
                left: widthMediaQuery / 4,
                right: widthMediaQuery / 4,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const BottomNavgationBar(),
                          ),
                        );
                      },
                      child: const Text(
                        "Masuk sebagai tamu",
                        style: TextStyle(
                          color: Color(0xFF293066),
                          fontFamily: 'Helvetica',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
