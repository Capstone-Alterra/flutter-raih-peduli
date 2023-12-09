import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/bank_ewallet.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/transaction_payment_type_screen.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/widgets/bank_small_widget.dart';
import 'package:flutter_raih_peduli/theme.dart';

// import 'package:flutter_raih_peduli/screen/view/volunteer/form_apply.dart';
// import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/save_widget.dart';

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';

class TransactionPaymentMethodScreen extends StatelessWidget {

  final TextEditingController controllerAmount;
  final Datum fundraise;

  TransactionPaymentMethodScreen({super.key, required this.fundraise, required this.controllerAmount});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Pilih Metode Pembayaran',
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        width: 1,
                        color: AppTheme.primaryColor.withOpacity(0.5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontFamily: 'Helvetica',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: controllerAmount,
                      enabled: false,
                      decoration: InputDecoration(
                        prefix: Text(
                          'Rp.',
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontFamily: 'Helvetica',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: AppTheme.secondaryColor.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Minimal Donasi Rp.10.000',
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontFamily: 'Helvetica',
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ))
                  ],
                ),
              ),
            ),

            // Volunteer Title
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 6,
                left: 20,
              ),
              child: Text(
                'Pilih Metode Pembayaran',
                style: const TextStyle(
                  color: AppTheme.tertiaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionPaymentTypeScreen(
                            fundraise: fundraise, paymentTypeList: ewallet, title: 'E-Wallet', amount:controllerAmount.text ),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 1,
                          color: AppTheme.primaryColor.withOpacity(0.3))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'E-Wallet',
                            style: TextStyle(
                              color: AppTheme.tertiaryColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              customSmallBank(photo: "assets/gopay.png"),
                              customSmallBank(photo: "assets/qris.png"),
                            ],
                          )
                        ],
                      ),
                      const Icon(
                          Icons.navigate_next,
                          color: AppTheme.primaryColor,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionPaymentTypeScreen(
                            fundraise: fundraise, paymentTypeList: bank, title: 'Bank Transfer', amount: controllerAmount.text,),
                      ));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 1,
                          color: AppTheme.primaryColor.withOpacity(0.3))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Transfer Bank',
                            style: TextStyle(
                              color: AppTheme.tertiaryColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              customSmallBank(photo: "assets/permata.png"),
                              customSmallBank(photo: "assets/cimb.png"),
                              customSmallBank(photo: "assets/bca.png"),
                              customSmallBank(photo: "assets/bri.png"),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              customSmallBank(photo: "assets/bni.png"),
                              customSmallBank(photo: "assets/mandiri.png"),
                            ],
                          )
                        ],
                      ),
                      const Icon(
                        Icons.navigate_next,
                        color: AppTheme.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
