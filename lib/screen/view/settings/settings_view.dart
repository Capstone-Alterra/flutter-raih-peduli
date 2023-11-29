import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/settings/edit_profile.dart';
// import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/sign_in.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view_model/view_model_navigation.dart';
import '../../view_model/view_model_signin.dart';
import '../signin_dan_signup/masuk_atau_daftar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  late SharedPreferences logindata;
  late SignInViewModel viewModel;
  late NavigationProvider nav;
  @override
  void initState() {
    viewModel = Provider.of<SignInViewModel>(context, listen: false);
    nav = Provider.of<NavigationProvider>(context, listen: false);
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        // title: const Text(
        //   'Pengaturan',
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontFamily: 'Helvetica',
        //     fontSize: 18,
        //     fontWeight: FontWeight.w700,
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Container(
                width: 360,
                height: 135,
                decoration: BoxDecoration(
                  color: const Color(0xff293066),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        viewModel.fotoSharedPreference,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.nameSharedPreference,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Helvetica',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          viewModel.emailSharedPreference,
                          style: const TextStyle(
                            fontFamily: 'Helvetica',
                            color: Color(0xffD1D1D1),
                            fontSize: 12,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            width: 110,
                            height: 34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: const Color(0xffA3A4A5),
                                width: 1,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                final foto = viewModel.fotoSharedPreference;
                                final email = viewModel.emailSharedPreference;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProfileEdit(foto: foto, email: email),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                'Ubah Profil',
                                style: TextStyle(
                                    color: Color(0xffA3A4A5),
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Opsi',
                    style: TextStyle(
                      color: Color(0xff293066),
                      fontFamily: 'Helvetica',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color(0xff293066),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/settings.svg'),
                          const SizedBox(width: 10),
                          const Text(
                            'Pemberitahuan',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Helvetica',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color(0xff293066),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/Notification - 3.svg'),
                          const SizedBox(width: 10),
                          const Text(
                            'Notifikasi',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Helvetica',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color(0xff293066),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/Question.svg'),
                          const SizedBox(width: 10),
                          const Text(
                            'Bantuan',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Helvetica',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Akun',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica',
                      color: Color(0xff293066),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color(0xff293066),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/language.svg'),
                                const SizedBox(width: 10),
                                const Text(
                                  'Bahasa',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Helvetica',
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            child: Row(
                              children: [
                                Text(
                                  'Indonesia',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Helvetica',
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_forward_ios_outlined,
                                    size: 15),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color(0xff293066),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/Settings2.svg'),
                          const SizedBox(width: 10),
                          const Text(
                            'Privasi',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Helvetica',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Oh tidak! Anda pergi...',
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Apa kamu yakin?',
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          // content: const Text('This is a warning message.'),
                          icon: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                              top: 10,
                            ),
                            child: Transform.scale(
                              scale: 1.3,
                              child: SvgPicture.asset(
                                  'assets/mingcute_warning_fill.svg'),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          actions: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20, left: 20, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: size.width * .25,
                                      height: size.width * .12,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: const Color(0xff293066),
                                          width: 3,
                                        ),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                          shadowColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                        ),
                                        child: const Text(
                                          'Batal',
                                          style: TextStyle(
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Color(0xff293066),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: size.width * .25,
                                      height: size.width * .12,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff293066),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          logindata.setBool('login', true);
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginAtauDaftar(),
                                            ),
                                            (route) => false,
                                          );
                                          
                                          nav.out();
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                          shadowColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                        ),
                                        child: const Text(
                                          'Ya, Tentu',
                                          style: TextStyle(
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color(0xff293066),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/logout.svg'),
                            const SizedBox(width: 10),
                            const Text(
                              'Keluar',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Helvetica',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
