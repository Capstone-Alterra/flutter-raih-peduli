import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/settings/ganti_kata_sandi.dart';
// import 'package:flutter_raih_peduli/screen/view/settings/edit_profile.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/settings/widget_banner.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_profile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../theme.dart';
import '../../view_model/view_model_navigation.dart';
import '../../view_model/view_model_signin.dart';
import '../fundraises/widgets/amount_button_widget.dart';
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
    sp.setSudahLogin();
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
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontFamily: 'Helvetica',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
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
                                      Image.asset(
                                        "assets/Password Reset.png",
                                        width: 24,
                                        height: 24,
                                        // fit: BoxFit.fill,
                                      ),
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
              : Center(
                  child: Column(
                    children: [
                      SizedBox(height: size.height / 12),
                      SvgPicture.asset(
                        "assets/setting_guest.svg",
                      ),
                      const SizedBox(height: 20),
                      customAmountButton(
                        text: 'Masuk / Daftar',
                        bgColor: const Color(0xFF293066),
                        width: size.width / 1.5,
                        height: size.height / 19,
                        textColor: Colors.white,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginAtauDaftar(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
