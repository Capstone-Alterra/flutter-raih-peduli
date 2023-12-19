// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/bank_ewallet.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/transaction_confirm_screen.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/widgets/payment_type.dart';
import 'package:flutter_raih_peduli/theme.dart';

class TransactionPaymentTypeScreen extends StatelessWidget {
  List<PaymentType> paymentTypeList;
  String amount;
  String title;
  final int id;

  TransactionPaymentTypeScreen(
      {super.key,
      required this.id,
      required this.paymentTypeList,
      required this.title,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            color: AppTheme.primaryColor,
            fontFamily: 'Helvetica',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppTheme.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (PaymentType paymentType in paymentTypeList)
              customPaymentType(
                photo: paymentType.photo,
                height: 40,
                text: paymentType.name,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactionConfirmScreen(
                          id: id, paymentType: paymentType, amount: amount),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
