// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/dialog_popup.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import '../../../view_model/view_model_detail_volunteer.dart';
import '../../../view_model/view_model_navigation.dart';
import '../../../view_model/view_model_signin.dart';
import '../login_signup/alert.dart';

class ButtonVolunteer extends StatefulWidget {
  final int volunteerId;
  const ButtonVolunteer({super.key, required this.volunteerId});

  @override
  State<ButtonVolunteer> createState() => _ButtonVolunteerState();
}

class _ButtonVolunteerState extends State<ButtonVolunteer> {
  late DetailVolunteerViewModel viewModel;
  late SignInViewModel sp;
  late NavigationProvider navigation;
  @override
  void initState() {
    viewModel = Provider.of<DetailVolunteerViewModel>(context, listen: false);
    sp = Provider.of<SignInViewModel>(context, listen: false);
    navigation = Provider.of<NavigationProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff8CA2CE).withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xff293066),
            ),
          ),
          height: size.height * 0.06,
          width: size.width * 0.43,
          child: ElevatedButton(
            onPressed: () {
              final snackBar = snackBarVolunteer(size, context);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Future.delayed(const Duration(seconds: 4), () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ProfileEdit()),
                // );
              });
            },
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
            ),
            child: const Text(
              'Batal',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xff293066),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff293066),
            borderRadius: BorderRadius.circular(8),
          ),
          height: size.height * 0.06,
          width: size.width * 0.43,
          child: ElevatedButton(
            onPressed: () async {
              await viewModel.fetchApplyVolunteer(
                volunteerId: widget.volunteerId,
                accessToken: sp.accessTokenSharedPreference,
                refreshToken: sp.refreshTokenSharedPreference,
              );
              if (viewModel.isSukses == true) {
                navigation.goRiwayat();
                showCustomDialog(context, size);
                viewModel.clearAll();
              } else {
                customAlert(
                  context: context,
                  alertType: QuickAlertType.error,
                  text: 'Terjadi kesalahan mohon coba lagi',
                );
              }
            },
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
            ),
            child: const Text(
              'Tambah',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
