import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/success_donation_screen.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_transaction.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// import '../navigation/navigation.dart';

class PaymentQrisPage extends StatelessWidget {
  const PaymentQrisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModelFundraise =
        Provider.of<FundraisesViewModel>(context, listen: false);
    final viewModelTransaction =
        Provider.of<TransactionViewModel>(context, listen: false);
    // final viewModelNavigation =
    //     Provider.of<NavigationProvider>(context, listen: false);

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
        }),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<TransactionViewModel>(builder: (context, isLoading, child) {
              return viewModelTransaction.isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    viewModelTransaction.modelTransaction!.data.urlCallback,
                    height: 350.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 1,
                          color: AppTheme.primaryColor.withOpacity(0.3))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Payment',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontFamily: 'Helvetica',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Rp. ${viewModelTransaction.modelTransaction!.data.amount}',
                            style: const TextStyle(
                              color: AppTheme.primaryColor,
                              fontFamily: 'Helvetica',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Valid Until',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontFamily: 'Helvetica',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                ),
              )
              // Tombol Ikuti Program
            ],
          );
            }),
      bottomNavigationBar: Consumer<TransactionViewModel>(
        builder: (context, isLoading, child) {
          return viewModelTransaction.isLoading
              ? const Text('')
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      viewModelTransaction.saveNetworkImage(viewModelTransaction.modelTransaction!.data.urlCallback);
                      Future.delayed(const Duration(seconds: 2));
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const SuccessDonationScreen(),
                        ),
                            (route) => false,
                      );

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
                        'Simpan Kode QR',
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
