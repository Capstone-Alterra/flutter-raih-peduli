// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/screen/view/navigation/navigation.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_transaction.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

import '../../view_model/view_model_navigation.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModelTransaction =
        Provider.of<TransactionViewModel>(context, listen: false);
    final viewModelFundraise =
        Provider.of<FundraisesViewModel>(context, listen: false);
    final viewModelNavigation =
        Provider.of<NavigationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<TransactionViewModel>(
          builder: (context, isLoading, child) {
            return viewModelTransaction.isLoading
                ? const Text('')
                : Text(
                    viewModelTransaction.modelTransaction!.data.paymentType,
                    style: const TextStyle(
                      color: AppTheme.primaryColor,
                      fontFamily: 'Helvetica',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<TransactionViewModel>(
        builder: (context, isLoading, child) {
          return viewModelTransaction.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      'Tekan Tombol Dibawah Untuk Membuka Aplikasi',
                      style: TextStyle(
                        color: AppTheme.tertiaryColor.withOpacity(0.9),
                        fontFamily: 'Helvetica',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
        },
      ),
      bottomNavigationBar: Consumer<TransactionViewModel>(
        builder: (context, isLoading, child) {
          return viewModelTransaction.isLoading
              ? const Text('')
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      String url = viewModelTransaction
                          .modelTransaction!.data.urlCallback;
                      viewModelTransaction.openGopay(Uri.parse(url));
                      viewModelNavigation.goRiwayat();
                      Future.delayed(const Duration(seconds: 10));
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BottomNavgationBar(),
                          ),
                          (route) => false);
                      viewModelFundraise.amountController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Buka Aplikasi Gopay',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
