import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
                      height: heightMediaQuery / 2.8,
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
                                TextFormField(
                                  controller: viewModel.email,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(15),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                      color: Color(0xFFB0B0B0),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Color(0xFF484F88),
                                    ),
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  controller: viewModel.password,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(15),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Password",
                                    hintStyle: const TextStyle(
                                      color: Color(0xFFB0B0B0),
                                    ),
                                    labelStyle: const TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                    prefixIcon: Image.asset(
                                      "assets/lock_password.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    border: InputBorder.none,
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {},
                                    ),
                                    const Text("Ingat saya"),
                                  ],
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF484F88),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                  ),
                                  onPressed: () async {
                                    final email = viewModel.email.text;
                                    final password = viewModel.password.text;
                                    viewModel.signIn(email, password);
                                  },
                                  child: SizedBox(
                                      width: widthMediaQuery,
                                      child:
                                          const Center(child: Text("Masuk"))),
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
                                            ..onTap = () {},
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
                    Positioned(
                        top: heightMediaQuery / 1.125,
                        left: widthMediaQuery / 4,
                        right: widthMediaQuery / 4,
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Masuk sebagai tamu",
                                style: TextStyle(color: Color(0xFF293066)),
                              ),
                            ),
                          ],
                        )),
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
