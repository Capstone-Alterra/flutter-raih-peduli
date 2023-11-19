import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SingupPage extends StatelessWidget {
  SingupPage({Key? key}) : super(key: key);
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: screenWidth,
              height: screenHeight,
            ),
            Container(
              width: screenWidth,
              height: 350,
              decoration: BoxDecoration(
                  color: Color(0xFF293066),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
            ),
            Positioned(
              top: 47,
              left: 29,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.grey[100],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 72,
                  ),
                  Image.asset('assets/Logo.png', height: 108, width: 115),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daftar',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Helvetica',
                              color: Colors.white),
                        ),
                        Text(
                          'Daftar, untuk dapat berkontribusi membantu sesama manusia',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Helvetica',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 27.3,
                  ),
                  Container(
                    width: 330,
                    height: 257,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5E9F4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 310.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                hintText: 'Nama Lengkap',
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/profile-fill.svg',
                                    width: 14,
                                    height: 14,
                                    color: Color(0xFF293066),
                                  ),
                                ),
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            width: 310.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/baseline-email.svg',
                                    width: 14,
                                    height: 14,
                                    color: Color(0xFF293066),
                                  ),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 310.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                hintText: 'Kata Sandi',
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/lock-password-bold.svg',
                                    width: 14,
                                    height: 14,
                                    color: Color(0xFF293066),
                                  ),
                                ),
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: (bool? value) {},
                                ),
                                Text(
                                  'Saya setuju dengan Kebijakan Privasi Raih Peduli',
                                  style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF293066),
                              fixedSize: const Size(310, 38),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              'Daftar',
                              style: TextStyle(fontFamily: 'Helvetica'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 8,
                child: SizedBox(
                  width: screenWidth,
                  child: Center(
                      child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Masuk sebagai tamu',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                            ),
                          ))),
                )),
          ],
        ),
      ),
    );
  }
}
