import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/forget_password/forget_password.dart';
import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/widget/button.dart';
import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/widget/textformfield.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignInViewModel>(context, listen: false);
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
                                'Masuk',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Masuk, untuk dapat berkontribusi membantu sesama manusia.',
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
                  child: Container(
                    height: heightMediaQuery / 2.8,
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
                          key: viewModel.formKey,
                          child: Column(
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
                              const SizedBox(height: 5),
                              customTextFormField(
                                  controller: viewModel.password,
                                  prefixIcon: Image.asset(
                                    "assets/lock.png",
                                  ),
                                  labelText: "Password",
                                  obscureText: true,
                                  validator: (value) =>
                                      viewModel.validatePassword(value!)),
                              Row(
                                children: [
                                  Consumer<SignInViewModel>(
                                    builder: (context, viewModel, child) {
                                      return Checkbox(
                                        value: viewModel.rememberMe,
                                        onChanged: (bool? value) {
                                          viewModel.setRememberMe(value!);
                                        },
                                        activeColor: viewModel.rememberMe
                                            ? const Color(0xFF484F88)
                                            : null,
                                      );
                                    },
                                  ),
                                  const Text("Ingat saya"),
                                ],
                              ),
                              customButton(
                                text: "Masuk",
                                bgColor: const Color(0xFF484F88),
                                onPressed: () async {
                                  if (viewModel.formKey.currentState!
                                      .validate()) {
                                    await viewModel.signIn();
                                    // if (viewModel.rememberMe != false) {
                                    final accessToken =
                                        viewModel.dataLogin!.data.accessToken;
                                    final refreshToken =
                                        viewModel.dataLogin!.data.refreshToken;
                                    await viewModel.saveDataSharedPreferences(
                                        accessToken, refreshToken);
                                    // }
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         const Verifikasi(),
                                    //   ),
                                    // );
                                  }
                                },
                              ),
                              const SizedBox(height: 15),
                              Center(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Lupa Password?',
                                        style: const TextStyle(
                                            color: Color(0xFF293066),
                                            fontSize: 14),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ForgetPassword(),
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
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: heightMediaQuery / 1.125,
                    left: widthMediaQuery / 4,
                    right: widthMediaQuery / 4,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Masuk sebagai tamu",
                            style: TextStyle(color: Color(0xFF293066)),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
