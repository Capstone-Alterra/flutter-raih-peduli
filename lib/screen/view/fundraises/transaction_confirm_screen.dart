// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/bank_ewallet.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/payment_basic_screen.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/payment_gopay_screen.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/payment_qris_screen.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_transaction.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class TransactionConfirmScreen extends StatelessWidget {
  String amount;
  PaymentType paymentType;
  final int id;

  TransactionConfirmScreen(
      {super.key,
      required this.id,
      required this.paymentType,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TransactionViewModel>(context, listen: false);
    final sp = Provider.of<SignInViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Konfirmasi Pembayaran',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontFamily: 'Helvetica',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppTheme.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: RichText(
            text: TextSpan(
              text: 'Apakah Anda Yakin Melanjutkan Pembayaran Dengan ',
              style: TextStyle(
                color: AppTheme.tertiaryColor.withOpacity(0.9),
                fontFamily: 'Helvetica',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '${paymentType.name}?',
                  style: const TextStyle(
                    color: AppTheme.primaryColor,
                    fontFamily: 'Helvetica',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            viewModel.createTransaction(
                accessToken: sp.accessTokenSharedPreference,
                refreshToken: sp.refreshTokenSharedPreference,
                amount: int.parse(amount),
                fundraiseId: id,
                paymentType: paymentType.id);
            if (paymentType.id == 11) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const PaymentQrisPage(),
                ),
                (route) => false,
              );
            } else if (bankPaymentIds.contains(paymentType.id)) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const PaymentBasicPage(),
                ),
                (route) => false,
              );
            } else if (paymentType.id == 10) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const PaymentPage(),
                ),
                (route) => false,
              );
            }
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
              'Lanjutkan Pembayaran',
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
