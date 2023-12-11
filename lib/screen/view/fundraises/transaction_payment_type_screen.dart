// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/bank_ewallet.dart';
// import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/transaction_confirm_screen.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/widgets/payment_type.dart';
// import 'package:flutter_raih_peduli/screen/view/fundraises/widgets/bank_small_widget.dart';
import 'package:flutter_raih_peduli/theme.dart';

// import 'package:flutter_raih_peduli/screen/view/volunteer/form_apply.dart';
// import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/save_widget.dart';

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';

class TransactionPaymentTypeScreen extends StatelessWidget {
  List<PaymentType> paymentTypeList;
  String amount;
  String title;
  // final Datum fundraise;
  final int id;

  TransactionPaymentTypeScreen({super.key, required this.fundraise, required this.paymentTypeList, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner Image
            for( PaymentType paymentType in paymentTypeList)
            customPaymentType(
                photo: paymentType.photo,
                height: 40,
                text: paymentType.name,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TransactionConfirmScreen(
                              fundraise: fundraise, paymentType: paymentType, amount: amount),
                      ));
                }),
          ],
        ),
      ),
    );
  }
}
