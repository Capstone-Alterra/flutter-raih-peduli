import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/history/card_riwayat_donasi.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/history/card_riwayat_relawan.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/history/card_riwayat_reqdonasi.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF293066),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HistoryDonationCard(),
            HistoryVolunteerCard(),
            HistoryRequestDonationCard(),
          ],
        ),
      ),
    );
  }
}
