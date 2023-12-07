import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/form_apply.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/save_widget.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TransactionPaymentMethodScreen extends StatelessWidget {
  final TextEditingController controllerAmount = TextEditingController();
  final Datum fundraise;
  TransactionPaymentMethodScreen({super.key, required this.fundraise});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: AppTheme.primaryColor.withOpacity(0.5))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontFamily: 'Helvetica',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),),
                    SizedBox(height: 5,),
                    TextField(
                      controller: controllerAmount,
                      decoration: InputDecoration(
                        prefix: Text('Rp.', style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontFamily: 'Helvetica',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: AppTheme.secondaryColor.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text('Minimal Donasi Rp.10.000', style: TextStyle(
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
              padding:  EdgeInsets.only(top: 20, bottom: 6, left: 20,),
              child: Text(
                'Pilih Metode Pembayaran',
                style: const TextStyle(
                  color: AppTheme.tertiaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: AppTheme.primaryColor.withOpacity(0.3))
                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start
                    ,children: [
                    Text('E-Wallet', style: TextStyle(
                      color: AppTheme.tertiaryColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Center(
                            child: Image.asset(
                              "assets/gopay.png",
                              // width: 90,
                              height: 30,
                            ),
                          ),
                          decoration: BoxDecoration(border: Border.all(width: 1, color: AppTheme.secondaryColor), borderRadius: BorderRadius.circular(5) ),
                        ),Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Center(
                            child: Image.asset(
                              "assets/qris.png",
                              // width: 90,
                              height: 30,
                            ),
                          ),
                          decoration: BoxDecoration(border: Border.all(width: 1, color: AppTheme.secondaryColor), borderRadius: BorderRadius.circular(5) ),
                        ),
                      ],
                    )
                  ],),
                  IconButton(
                    icon: const Icon(
                      Icons.navigate_next,
                      color: AppTheme.primaryColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                ],
              ),
            ),),
            Padding(padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: AppTheme.primaryColor.withOpacity(0.3))
                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start
                    ,children: [
                    Text('Transfer Bank', style: TextStyle(
                      color: AppTheme.tertiaryColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Center(
                            child: Image.asset(
                              "assets/permata.png",
                              // width: 90,
                              height: 30,
                            ),
                          ),
                          decoration: BoxDecoration(border: Border.all(width: 1, color: AppTheme.secondaryColor), borderRadius: BorderRadius.circular(5) ),
                        ),Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Center(
                            child: Image.asset(
                              "assets/cimb.png",
                              // width: 90,
                              height: 30,
                            ),
                          ),
                          decoration: BoxDecoration(border: Border.all(width: 1, color: AppTheme.secondaryColor), borderRadius: BorderRadius.circular(5) ),
                        ),Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Center(
                            child: Image.asset(
                              "assets/bca.png",
                              // width: 90,
                              height: 30,
                            ),
                          ),
                          decoration: BoxDecoration(border: Border.all(width: 1, color: AppTheme.secondaryColor), borderRadius: BorderRadius.circular(5) ),
                        ),Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Center(
                            child: Image.asset(
                              "assets/bri.png",
                              // width: 90,
                              height: 30,
                            ),
                          ),
                          decoration: BoxDecoration(border: Border.all(width: 1, color: AppTheme.secondaryColor), borderRadius: BorderRadius.circular(5) ),
                        ),
                      ],
                    ),SizedBox(height: 6,), Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Center(
                            child: Image.asset(
                              "assets/bni.png",
                              // width: 90,
                              height: 30,
                            ),
                          ),
                          decoration: BoxDecoration(border: Border.all(width: 1, color: AppTheme.secondaryColor), borderRadius: BorderRadius.circular(5) ),
                        ),Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Center(
                            child: Image.asset(
                              "assets/mandiri.png",
                              // width: 90,
                              height: 30,
                            ),
                          ),
                          decoration: BoxDecoration(border: Border.all(width: 1, color: AppTheme.secondaryColor), borderRadius: BorderRadius.circular(5) ),
                        ),
                      ],
                    )
                  ],),
                  IconButton(
                    icon: const Icon(
                      Icons.navigate_next,
                      color: AppTheme.primaryColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                ],
              ),
            ),),

          ],
        ),
      ),
    );
  }
}
