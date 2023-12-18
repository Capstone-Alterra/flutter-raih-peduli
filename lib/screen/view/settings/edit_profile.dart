// ignore_for_file: must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/settings/text_title_text_field.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../view_model/view_model_profile.dart';
import '../widgets/settings/text_field_setting.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

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
    viewModel.awal();
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
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff293066),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height * 1.1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Consumer<ProfileViewModel>(
                  builder: (context, contactModel, child) {
                    return viewModel.isEdit
                        ? GestureDetector(
                            onTap: () {
                              showImagePickerOption(context);
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: size.width * 0.17,
                                      backgroundImage:
                                          viewModel.imageFile != null
                                              ? Image.file(viewModel.imageFile!)
                                                  .image
                                              : NetworkImage(
                                                  viewModel.modelProfile!.data
                                                      .profilePicture,
                                                ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: size.width * 0.25,
                                      child:
                                          SvgPicture.asset('assets/edit.svg'),
                                    ),
                                  ],
                                ),
                                if (viewModel.fotoLebihLimaMB == true)
                                  Text(
                                    'File lebih dari 5MB',
                                    style: TextStyle(
                                      fontSize: size.height / 60,
                                      color: Colors.red,
                                    ),
                                  ),
                              ],
                            ),
                          )
                        : GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: size.width * 0.17,
                              backgroundImage: viewModel.imageFile != null
                                  ? Image.file(viewModel.imageFile!).image
                                  : NetworkImage(
                                      viewModel
                                          .modelProfile!.data.profilePicture,
                                    ),
                            ),
                          );
                  },
                ),
                SizedBox(height: size.height * 0.03),
                Consumer<ProfileViewModel>(
                  builder: (context, contactModel, child) {
                    return viewModel.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Form(
                            key: viewModel.formKey,
                            child: Column(
                              children: [
                                textSetting(text: "Fullname"),
                                textFieldSetting(
                                  controller: viewModel.fullNameController,
                                  labelText:
                                      viewModel.modelProfile!.data.fullname,
                                  enable: viewModel.isEdit,
                                  fill: viewModel.isEdit
                                      ? Colors.white
                                      : const Color.fromARGB(
                                          130, 158, 158, 158),
                                  colorhintext: viewModel.isEdit
                                      ? const Color(0xFF999999)
                                      : Colors.black,
                                ),
                                SizedBox(height: size.height * 0.015),
                                textSetting(text: "Email"),
                                textFieldSetting(
                                  controller: viewModel.emailController,
                                  labelText: viewModel.modelProfile!.data.email,
                                  enable: false,
                                  fill: viewModel.isEdit
                                      ? Colors.white
                                      : const Color.fromARGB(
                                          130, 158, 158, 158),
                                  colorhintext: Colors.black,
                                ),
                                SizedBox(height: size.height * 0.015),
                                textSetting(text: "Nomor Telepon"),
                                textFieldSetting(
                                  controller: viewModel.telpController,
                                  labelText:
                                      viewModel.modelProfile!.data.phoneNumber,
                                  enable: viewModel.isEdit,
                                  fill: viewModel.isEdit
                                      ? Colors.white
                                      : const Color.fromARGB(
                                          130, 158, 158, 158),
                                  colorhintext: viewModel.isEdit
                                      ? const Color(0xFF999999)
                                      : Colors.black,
                                  validator:
                                      viewModel.isEdit && viewModel.isCheckNik
                                          ? (value) =>
                                              viewModel.validateNomor(value!)
                                          : null,
                                ),
                                SizedBox(height: size.height * 0.015),
                                textSetting(text: "Alamat"),
                                textFieldSetting(
                                  controller: viewModel.alamatController,
                                  labelText:
                                      viewModel.modelProfile!.data.address,
                                  enable: viewModel.isEdit,
                                  fill: viewModel.isEdit
                                      ? Colors.white
                                      : const Color.fromARGB(
                                          130, 158, 158, 158),
                                  colorhintext: viewModel.isEdit
                                      ? const Color(0xFF999999)
                                      : Colors.black,
                                ),
                                SizedBox(height: size.height * 0.015),
                                textSetting(text: "Nik"),
                                textFieldSetting(
                                  controller: viewModel.nikController,
                                  labelText: viewModel.modelProfile!.data.nik,
                                  enable:
                                      viewModel.isEdit && viewModel.isCheckNik,
                                  fill: viewModel.isEdit
                                      ? Colors.white
                                      : const Color.fromARGB(
                                          130, 158, 158, 158),
                                  colorhintext:
                                      viewModel.isEdit && viewModel.isCheckNik
                                          ? const Color(0xFF999999)
                                          : Colors.black,
                                  validator: viewModel.isEdit &&
                                          viewModel.isCheckNik
                                      ? (value) => viewModel.validateNik(value!)
                                      : null,
                                ),
                              ],
                            ),
                          );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<ProfileViewModel>(
                  builder: (context, contactModel, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            viewModel.enable();
                            viewModel.clearAll();
                          },
                          child:
                              Text(viewModel.isEdit ? "Batal" : "Edit Profile"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                viewModel.isEdit ? Colors.red : Colors.blueGrey,
                          ),
                        ),
                        const SizedBox(width: 10),
                        if (viewModel.isEdit)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                            ),
                            onPressed: () async {
                              if (viewModel.formKey.currentState!.validate()) {
                                viewModel.enable();
                                await viewModel.fetchNik(
                                  accessToken: sp.accessTokenSharedPreference,
                                  refreshToken: sp.refreshTokenSharedPreference,
                                  email: viewModel.modelProfile!.data.email,
                                );
                                await viewModel.fetchProfileTanpaLoading(
                                  accessToken: sp.accessTokenSharedPreference,
                                  refreshToken: sp.refreshTokenSharedPreference,
                                );
                                sp.updateFoto(
                                  updatefoto: viewModel
                                      .modelProfile!.data.profilePicture,
                                  updateName:
                                      viewModel.modelProfile!.data.fullname,
                                );
                                await sp.saveDataSharedPreferences();
                                viewModel.clearAll();
                              }
                            },
                            child: const Text("Simpan"),
                          ),
                      ],
                    );
                  },
                ),
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
                            size: 14.35,
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
                          onTap: () {
                            Navigator.pop(context);
                            viewModel.pickImageKamera();
                          },
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
                          onTap: () {
                            Navigator.pop(context);
                            viewModel.pickImage();
                          },
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
