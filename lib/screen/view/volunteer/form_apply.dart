// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';
import '../../view_model/view_model_detail_volunteer.dart';
import '../widgets/volunteer/button_volunteer.dart';
import '../widgets/volunteer/text_form.dart';

class ApplyFormVolunteer extends StatefulWidget {
  final int volunteerId;
  const ApplyFormVolunteer({super.key, required this.volunteerId});

  @override
  State<ApplyFormVolunteer> createState() => _ApplyFormVolunteerState();
}

class _ApplyFormVolunteerState extends State<ApplyFormVolunteer> {
  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<DetailVolunteerViewModel>(context, listen: false);
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
      body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
            size.width * 0.05,
            size.height * 0.02,
            size.width * 0.05,
            size.height * 0.05,
          ),
          child: const TextFormVolunteer()),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ButtonVolunteer(
          volunteerId: widget.volunteerId,
        ),
      ),
    );
  }
}
