// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/navigation/navigation.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_navigation.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class SuccessDonationScreen extends StatelessWidget {

  const SuccessDonationScreen(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    final viewModelNavigation =
    Provider.of<NavigationProvider>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Image.asset('assets/checklist.png'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30.0,  left: 5.0, right: 5.0),
                child: Text("Terima kasih!", style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
              ),const Padding(
                padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                child: Text("Donasi telah berhasil dilakukan", style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                ),),
              ),Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text("Cek riwayat untuk melihat riwayat donasi", style: TextStyle(
                  color: AppTheme.primaryColor.withOpacity(0.6),
                  fontFamily: 'Helvetica',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),),
              ),
            ],
          )
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            viewModelNavigation.goRiwayat();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const BottomNavgationBarWidget(),
                ),
                    (route) => false);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(8.0),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Pergi Ke Halaman Riwayat',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
