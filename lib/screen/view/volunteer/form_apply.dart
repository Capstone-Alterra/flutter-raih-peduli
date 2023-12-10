import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/button_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/text_form.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_detail_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class ApplyFormVolunteer extends StatefulWidget {
  final int volunteerId;

  const ApplyFormVolunteer({super.key, required this.volunteerId});

  @override
  State<ApplyFormVolunteer> createState() => _ApplyFormVolunteerState();
}

class _ApplyFormVolunteerState extends State<ApplyFormVolunteer> {
  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<DetailVolunteerViewModel>(context, listen: false);
    viewModel.checkNik(context);
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
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppTheme.primaryColor,
          ),
          onPressed: () {
            Provider.of<DetailVolunteerViewModel>(context, listen: false)
                .clearAll();
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
            size.width * 0.05,
            size.height * 0.02,
            size.width * 0.05,
            size.height * 0.05,
          ),
          child: const TextFormVolunteer(),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.15,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ButtonVolunteer(
            volunteerId: widget.volunteerId,
          ),
        ),
      ),
    );
  }
}
