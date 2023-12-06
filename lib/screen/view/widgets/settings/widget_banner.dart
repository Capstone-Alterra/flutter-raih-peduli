// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:provider/provider.dart';

import '../../../view_model/view_model_profile.dart';
import '../../settings/edit_profile.dart';

class BannerSetting extends StatefulWidget {
  const BannerSetting({Key? key}) : super(key: key);

  @override
  State<BannerSetting> createState() => _BannerSettingState();
}

class _BannerSettingState extends State<BannerSetting> {
  late final ProfileViewModel viewModel;
  late SignInViewModel sp;
  @override
  void initState() {
    sp = Provider.of<SignInViewModel>(context, listen: false);
    viewModel = Provider.of<ProfileViewModel>(context, listen: false);
    sp = Provider.of<SignInViewModel>(context, listen: false);
    final accessToken = sp.accessTokenSharedPreference;
    final refreshToken = sp.refreshTokenSharedPreference;
    viewModel.fetchProfile(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<ProfileViewModel>(context, listen: false);
    return Container(
      width: 360,
      height: 135,
      decoration: BoxDecoration(
        color: const Color(0xff293066),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Consumer<ProfileViewModel>(
        builder: (context, contactModel, child) {
          return viewModel.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Row(
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
                        viewModel.modelProfile!.data.profilePicture,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.modelProfile!.data.fullname,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Helvetica',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          viewModel.modelProfile!.data.email,
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileEdit(),
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
                );
        },
      ),
    );
  }
}
