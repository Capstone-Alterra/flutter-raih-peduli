import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/transaction_amount_screen.dart';
import 'package:flutter_raih_peduli/screen/view/home/homescreen.dart';

// import 'package:flutter_raih_peduli/screen/view/volunteer/form_apply.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_transaction.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';
// Future launchUrl(Uri url) async {
//   if (!await launchUrl(url)) {
//     throw Exception('Could not launch $url');
//   }
// }
class PaymentPage extends StatelessWidget {
  // final Datum fundraise;
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModelFundraise =
        Provider.of<FundraisesViewModel>(context, listen: false);
    final viewModelTransaction =
        Provider.of<TransactionViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<TransactionViewModel>(
            builder: (context, isLoading, child) {
          return viewModelTransaction.isLoading
              ? Text('')
              : Text(
                  viewModelTransaction.modelTransaction!.data.paymentType,
                  style: TextStyle(
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
      body:
          Consumer<TransactionViewModel>(builder: (context, isLoading, child) {
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
                )),
              );
      }),
      bottomNavigationBar: Consumer<TransactionViewModel>(builder: (context, isLoading, child) {
      return viewModelTransaction.isLoading
          ? Text('')
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // viewModelTransaction.openGopay(viewModelTransaction.modelTransaction!.data.urlCallback);
            // Navigator.of(context).pushAndRemoveUntil(
            //   MaterialPageRoute(
            //     builder: (context) => HomeScreen(),
            //   ),
            //   (route) => false,
            // );
            // viewModelFundraise.amountController.clear();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme
                .primaryColor, // Warna fill sesuai AppTheme.primaryColor
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8.0), // Tombol bulat dengan radius 20.0
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
      );}),
    );
  }
}
