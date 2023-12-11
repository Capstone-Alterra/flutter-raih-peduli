import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/bank_ewallet.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/payment_basic_screen.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/payment_gopay_screen.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/payment_qris_screen.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/transaction_payment_method_screen.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/widgets/amount_button_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_transaction.dart';

// import 'package:flutter_raih_peduli/screen/view/volunteer/form_apply.dart';
// import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/save_widget.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';

class TransactionConfirmScreen extends StatelessWidget {
  String amount;
  PaymentType paymentType;
  final Datum fundraise;

  TransactionConfirmScreen(
      {super.key,
      required this.fundraise,
      required this.paymentType,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TransactionViewModel>(context, listen: false);
    final sp = Provider.of<SignInViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;

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
        // actions: [
        //   SaveWidget(),
        // ],
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
                  style: TextStyle(
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
                fundraiseId: fundraise.id,
                paymentType: paymentType.id);
            //Tambahkan logika yang diinginkan saat tombol ditekan


            if (paymentType.id == 11) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) =>
                  const PaymentQrisPage(),
                ),
                    (route) => false,
              );
            } else if(bankPaymentIds.contains(paymentType.id)){
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) =>
                  const PaymentBasicPage(),
                ),
                    (route) => false,
              );
            } else if(paymentType.id == 10){
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) =>
                  const PaymentPage(),
                ),
                    (route) => false,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            // Warna fill sesuai AppTheme.primaryColor
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8.0), // Tombol bulat dengan radius 20.0
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
