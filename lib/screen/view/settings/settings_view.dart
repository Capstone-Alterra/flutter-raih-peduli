import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/settings/ganti_kata_sandi.dart';
// import 'package:flutter_raih_peduli/screen/view/settings/edit_profile.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/settings/widget_banner.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_profile.dart';
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
  late final ProfileViewModel viewModel;
  late SharedPreferences logindata;
  late SignInViewModel sp;
  late NavigationProvider nav;
  @override
  void initState() {
    viewModel = Provider.of<ProfileViewModel>(context, listen: false);
    sp = Provider.of<SignInViewModel>(context, listen: false);
    final accessToken = sp.accessTokenSharedPreference;
    final refreshToken = sp.refreshTokenSharedPreference;
    nav = Provider.of<NavigationProvider>(context, listen: false);
    sp.setSudahLogibn();
    viewModel.fetchProfile(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
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
        automaticallyImplyLeading: false,
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Helvetica',
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Consumer<SignInViewModel>(
        builder: (context, viewModel, child) {
          return sp.isSudahLogin
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const BannerSetting(),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color:
                                                        const Color(0xff293066),
                                                    width: 3,
                                                  ),
                                                ),
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .transparent),
                                                    shadowColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .transparent),
                                                  ),
                                                  child: const Text(
                                                    'Batal',
                                                    style: TextStyle(
                                                      fontFamily: 'Helvetica',
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                  color:
                                                      const Color(0xff293066),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    logindata.setBool(
                                                        'login', true);
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const LoginAtauDaftar(),
                                                      ),
                                                      (route) => false,
                                                    );
                                                    sp.keluar();
                                                    nav.out();
                                                  },
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .transparent),
                                                    shadowColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .transparent),
                                                  ),
                                                  child: const Text(
                                                    'Ya, Tentu',
                                                    style: TextStyle(
                                                      fontFamily: 'Helvetica',
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
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
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GantiPassword()),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/Password Reset.svg'),
                                      const SizedBox(width: 10),
                                      const Text(
                                        'Ubah Kata Sandi',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Helvetica',
                                        ),
                                      ),
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
                )
              : Text("text${sp.isSudahLogin}");
        },
      ),
    );
  }
}
