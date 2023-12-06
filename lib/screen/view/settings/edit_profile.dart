// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/settings/widget_profile_edit.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../view_model/view_model_profile.dart';

class ProfileEdit extends StatefulWidget {
  // String foto;
  // String fullname;
  // String email;
  // String telp;
  // String address;
  ProfileEdit(
      {
      //   required this.foto,
      // required this.fullname,
      // required this.email,
      // required this.telp,
      // required this.address,
      super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  late ProfileViewModel viewModel;
  late SignInViewModel sp;
  @override
  void initState() {
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
    Size size = MediaQuery.of(context).size;
    TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ubah Profile',
          style: TextStyle(
              color: Color(0xff293066),
              fontFamily: 'Helvetica',
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
          child: Align(
            alignment: const AlignmentDirectional(0.00, 0.00),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showImagePickerOption(context);
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: size.width * 0.19,
                        backgroundImage: NetworkImage(
                            // widget.foto,
                            viewModel.modelProfile!.data.profilePicture),
                      ),
                      Positioned(
                        bottom: 0,
                        left: size.width * 0.30,
                        child: SvgPicture.asset('assets/edit.svg'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.1),
                EditTextField(
                  profileData: viewModel.modelProfile!.data,
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.fetchNik(
                      accessToken: sp.accessTokenSharedPreference,
                      refreshToken: sp.refreshTokenSharedPreference,
                    );
                  },
                  child: Text("send"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      )),
      backgroundColor: Colors.white,
      context: context,
      builder: (builder) {
        return SizedBox(
          width: size.width * 0.9,
          height: size.height * 0.26,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              size.width * 0.05,
              size.height * 0.001,
              size.width * 0.05,
              size.height * 0.01,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ubah Foto Profil',
                      style: TextStyle(
                          color: Color(0xff293066),
                          fontFamily: 'Helvetica',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: size.width * 0.07,
                      height: size.height * 0.07,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff293066),
                      ),
                      child: IconButton(
                          splashRadius: 1,
                          alignment: Alignment.center,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 14.38,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: size.width * 0.2,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xff293066),
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Color(0xff293066),
                              size: 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01),
                          child: const Text(
                            'Kamera',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 20,
                              color: Color(0xff293066),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: size.width * 0.2,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xff293066),
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.image,
                              color: Color(0xff293066),
                              size: 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01),
                          child: const Text(
                            'Galeri',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 20,
                              color: Color(0xff293066),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
