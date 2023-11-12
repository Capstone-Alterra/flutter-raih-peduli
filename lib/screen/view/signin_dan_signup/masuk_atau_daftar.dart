import 'package:flutter/material.dart';

class LoginAtauDaftar extends StatelessWidget {
  const LoginAtauDaftar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: widthMediaQuery,
        height: heightMediaQuery,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                height: heightMediaQuery / 2.15,
                width: widthMediaQuery,
                decoration: const BoxDecoration(
                    color: Color(0xFF293066),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                child: Center(
                  child: Image.asset(
                    "assets/raih_peduli_putih.png",
                    width: 120.0,
                    height: 120.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: heightMediaQuery / 2.5,
              left: widthMediaQuery / 15,
              right: widthMediaQuery / 15,
              height: heightMediaQuery / 3.5,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                'Selamat Datang di Raih Peduli',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Raih keberkahan dengan kepedulian',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF484F88),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                              ),
                              onPressed: () {},
                              child: SizedBox(
                                  width: widthMediaQuery,
                                  child: const Center(child: Text("Masuk"))),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE5E9F4),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  side: const BorderSide(
                                      color: Color(0xFF484F88), width: 1),
                                ),
                              ),
                              onPressed: () {},
                              child: SizedBox(
                                  width: widthMediaQuery,
                                  child: const Center(
                                      child: Text(
                                    "Daftar",
                                    style: TextStyle(color: Color(0xFF293066)),
                                  ))),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: heightMediaQuery / 1.08,
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
    );
  }
}
