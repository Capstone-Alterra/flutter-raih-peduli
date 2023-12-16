// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/text_form_belum_login.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';
import '../../view_model/view_model_detail_volunteer.dart';
import '../../view_model/view_model_profile.dart';
import '../widgets/volunteer/button_volunteer.dart';
import '../widgets/volunteer/text_form.dart';

class ApplyFormVolunteer extends StatefulWidget {
  final int volunteerId;
  const ApplyFormVolunteer({super.key, required this.volunteerId});

  @override
  State<ApplyFormVolunteer> createState() => _ApplyFormVolunteerState();
}

class _ApplyFormVolunteerState extends State<ApplyFormVolunteer> {
  late DetailVolunteerViewModel viewModel;
  late ProfileViewModel profile;
  late SignInViewModel sp;
  @override
  void initState() {
    viewModel = Provider.of<DetailVolunteerViewModel>(context, listen: false);
    profile = Provider.of<ProfileViewModel>(context, listen: false);
    sp = Provider.of<SignInViewModel>(context, listen: false);
    profile.fetchProfile(
      accessToken: sp.accessTokenSharedPreference,
      refreshToken: sp.refreshTokenSharedPreference,
    );
    viewModel.fetchSkill(
      accessToken: sp.accessTokenSharedPreference,
      refreshToken: sp.refreshTokenSharedPreference,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Lamar Relawan',
          style: TextStyle(
              color: Color(0xff293066),
              fontFamily: 'Helvetica',
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppTheme.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
            viewModel.clearAll();
          },
        ),
      ),
      body: Consumer<ProfileViewModel>(
        builder: (context, profil, child) {
          if (profile.isLoading == false) {
            if (profile.modelProfile!.data.nik.isEmpty) {
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  size.width * 0.05,
                  size.height * 0.02,
                  size.width * 0.05,
                  size.height * 0.05,
                ),
                child: const TextFormVolunteerBelumNik(),
              );
            } else {
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  size.width * 0.05,
                  size.height * 0.02,
                  size.width * 0.05,
                  size.height * 0.05,
                ),
                child: const TextFormVolunteer(),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: Consumer<ProfileViewModel>(
        builder: (context, contactModel, child) {
          if (profile.isLoading == false) {
            if (profile.modelProfile!.data.nik.isEmpty) {
              return const SizedBox(height: 1);
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ButtonVolunteer(
                  volunteerId: widget.volunteerId,
                  nik: profile.modelProfile!.data.nik,
                ),
              );
            }
          } else {
            return const SizedBox(height: 1);
          }
        },
      ),
    );
  }
}
