import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/bottomnavbar.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_settings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  late final SettingsViewProvider settingsViewProvider;
  @override
  void initState() {
    super.initState();
    settingsViewProvider =
        Provider.of<SettingsViewProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Container(
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
                      'https://picsum.photos/seed/780/600',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Talitha Syahla',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Helvetica',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Text(
                        'talitha_syahla@upi.edu',
                        style: TextStyle(
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
                            onPressed: () {},
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
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(31, 0, 31, 0),
            child: Column(
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
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
                              Icon(Icons.arrow_forward_ios_outlined, size: 15),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: size.width * .155,
        decoration: const BoxDecoration(
          color: Color(0xffF4F6FA),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8),
          ),
        ),
        child: Consumer<SettingsViewProvider>(
          builder: (context, provider, child) {
            return ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: size.width * .024),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  settingsViewProvider.updateIndex(index);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: index == settingsViewProvider.currentIndex
                            ? 0
                            : size.width * .029,
                        right: size.width * .0422,
                        left: size.width * .0422,
                      ),
                      width: size.width * .128,
                      height: index == settingsViewProvider.currentIndex
                          ? size.width * .014
                          : 0,
                      decoration: BoxDecoration(
                        color: const Color(0xff282f65),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    SvgPicture.asset(
                      contents[index].image,
                      height: size.width * .066,
                      colorFilter: ColorFilter.mode(
                        index == settingsViewProvider.currentIndex
                            ? const Color(0xff293066)
                            : const Color(0xff293066).withOpacity(.4),
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      contents[index].title,
                      style: TextStyle(
                        fontFamily: 'Helevetica',
                        fontSize: 12,
                        color: index == settingsViewProvider.currentIndex
                            ? const Color(0xff293066)
                            : const Color(0xff293066).withOpacity(.4),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
