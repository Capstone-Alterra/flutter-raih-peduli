import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/history/card_riwayat_donasi.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/history/card_riwayat_relawan.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/history/card_riwayat_reqdonasi.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/history/card_riwayat_reqvolunteer.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';
import '../../view_model/view_model_signin.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  late SignInViewModel sp;
  @override
  void initState() {
    sp = Provider.of<SignInViewModel>(context, listen: false);
    sp.setSudahLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Riwayat',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontFamily: 'Helvetica',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        height:
            MediaQuery.of(context).size.height, // Adjust this height as needed
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height, // Set a minimum height
              ),
              child: const Column(
                children: [
                  SizedBox(height: 10),
                  HistoryDonationCard(),
                  SizedBox(height: 10),
                  HistoryApplyVolunteerCard(),
                  SizedBox(height: 10),
                  HistoryRequestDonationCard(),
                  SizedBox(height: 10),
                  HistoryReqVolunteerCard(),
                  SizedBox(height: 10),
                  // Add more cards or widgets here as needed
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
