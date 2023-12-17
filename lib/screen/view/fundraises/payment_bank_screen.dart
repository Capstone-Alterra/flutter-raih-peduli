import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/bank_ewallet.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/success_donation_screen.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_transaction.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../view_model/view_model_navigation.dart';
import '../navigation/navigation.dart';

class PaymentBankPage extends StatelessWidget {
  PaymentType paymentType;
  PaymentBankPage({super.key, required this.paymentType});

  @override
  Widget build(BuildContext context) {
    final viewModelFundraise =
        Provider.of<FundraisesViewModel>(context, listen: false);
    final viewModelTransaction =
        Provider.of<TransactionViewModel>(context, listen: false);
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
                  '${viewModelTransaction.modelTransaction!.data.paymentType} ${paymentType.kode}',
                  style: const TextStyle(
                    color: AppTheme.primaryColor,
                    fontFamily: 'Helvetica',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                );
        }),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<TransactionViewModel>(
        builder: (context, isLoading, child) {
          return viewModelTransaction.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1,
                                color:
                                    AppTheme.primaryColor.withOpacity(0.3))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'No. Virtual Account',
                                      style: TextStyle(
                                        fontFamily: 'Helvetica',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      viewModelTransaction.modelTransaction!
                                          .data.virtualAccount,
                                      style: const TextStyle(
                                        color: AppTheme.primaryColor,
                                        fontFamily: 'Helvetica',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        viewModelTransaction.salinKeClipboard(viewModelTransaction.modelTransaction!.data.virtualAccount);
                                      },
                                      child: const Icon(
                                        size: 20,
                                        Icons.copy,
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Pembayaran',
                                      style: TextStyle(
                                        fontFamily: 'Helvetica',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Rp.${viewModelTransaction.modelTransaction!.data.amount}',
                                      style: const TextStyle(
                                        color: AppTheme.primaryColor,
                                        fontFamily: 'Helvetica',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Batas Pembayaran',
                                      style: TextStyle(
                                        fontFamily: 'Helvetica',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat('dd MMMM yyy , hh:mm').format(DateTime.parse(viewModelTransaction.modelTransaction!.data.validUntil.toString())),
                                      style: const TextStyle(
                                        color: AppTheme.primaryColor,
                                        fontFamily: 'Helvetica',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    // Tombol Ikuti Program
                  ],
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
                    onPressed: () {
                      viewModelTransaction.urlLauncher(Uri.parse(paymentType.url));
                      Future.delayed(const Duration(seconds: 2));
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => SuccessDonationScreen(),
                        ),
                        (route) => false,
                      );
                      viewModelFundraise.amountController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme
                          .primaryColor, // Warna fill sesuai AppTheme.primaryColor
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Tombol bulat dengan radius 20.0
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Lanjutkan',
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
