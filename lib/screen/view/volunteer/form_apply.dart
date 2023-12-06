import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/button_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/text_form.dart';

class ApplyFormVolunteer extends StatefulWidget {
  final int volunteerId;

  const ApplyFormVolunteer({super.key, required this.volunteerId});

  @override
  State<ApplyFormVolunteer> createState() => _ApplyFormVolunteerState();
}

class _ApplyFormVolunteerState extends State<ApplyFormVolunteer> {
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
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          size.width * 0.05,
          size.height * 0.02,
          size.width * 0.05,
          size.height * 0.05,
        ),
        child: Column(
          children: [
            const TextFormVolunteer(),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.12),
              child: ButtonVolunteer(
                volunteerId: widget.volunteerId,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
