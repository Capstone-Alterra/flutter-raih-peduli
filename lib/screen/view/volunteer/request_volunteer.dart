import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/button_request_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/form_request_volunteer.dart';

class RequestVolunteerScreen extends StatefulWidget {
  const RequestVolunteerScreen({super.key});

  @override
  State<RequestVolunteerScreen> createState() => _RequestVolunteerScreenState();
}

class _RequestVolunteerScreenState extends State<RequestVolunteerScreen> {
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
          'Buat Pengajuan Relawan',
          style: TextStyle(
              color: Color(0xff293066),
              fontFamily: 'Helvetica',
              fontSize: 22,
              fontWeight: FontWeight.bold),
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
            const FormRequestVolunteer(),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.07),
              child: const ButtonRequestVolunteer(),
            ),
          ],
        ),
      ),
    );
  }
}
