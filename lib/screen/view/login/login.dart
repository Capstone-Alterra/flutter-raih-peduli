import '/screen/view/login/signup_page.dart';
import '/screen/view/login/login_page.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: screenWidth,
            height: screenHeight,
          ),
          Container(
            width: screenWidth,
            height: 429,
            decoration: const BoxDecoration(
                color: Color(0xFF293066),
                borderRadius: BorderRadius.only(
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
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 103.5),
                Image.asset('assets/Logo.png', height: 108, width: 115),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'RAIH PEDULI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    fontFamily: 'Helvetica',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 82.97,
                ),
                Container(
                  width: 330,
                  height: 216,
                  decoration: BoxDecoration(
                      color: Color(0xFFE5E9F4),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                'Selamat Datang di Raih Peduli',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                              Text(
                                'Raih keberkahan dengan kepedulian',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF293066),
                            fixedSize: const Size(310, 38),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text('Masuk'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SingupPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            side: const BorderSide(
                                color: Color(0xFF293066), width: 1),
                            elevation: 0,
                            fixedSize: const Size(310, 38),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'Daftar',
                            style: TextStyle(color: Color(0xFF293066)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
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
                        child: const Text(
                          'Masuk sebagai tamu',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                          ),
                        ))),
              )),
        ],
      ),
    );
  }
}
