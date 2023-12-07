import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/transaction_payment_method_screen.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/form_apply.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/save_widget.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TransactionAmountScreen extends StatelessWidget {
  final TextEditingController controllerAmount = TextEditingController();
  final Datum fundraise;
  TransactionAmountScreen({super.key, required this.fundraise});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Pilih Jumlah Donasi',
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
                    Text('Masukkan Nominal Donasi',
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
                'Pilih Jumlah Donasi',
                style: const TextStyle(
                  color: AppTheme.tertiaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: AppTheme.primaryColor.withOpacity(0.5))
                ),
                child:  Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppTheme.tertiaryColor),
                              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0), // Set your desired border radius
                                ),
                              ),
                                fixedSize: MaterialStateProperty.all(Size(size.width/2.6, 50))

                            ),
                            onPressed: () {
                              // Do something with the entered text
                              print('Entered Text:');
                            },
                            child: Text('Rp.20.000', style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            )),

                          ),
                          SizedBox(width: size.width/20,),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppTheme.tertiaryColor),
                              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0), // Set your desired border radius
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all(Size(size.width/2.6, 50))

                            ),
                            onPressed: () {
                              // Do something with the entered text
                              print('Entered Text:');
                            },
                            child: Text('Rp.30.000', style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            )),


                          ),
                        ],
                      ),
                    ), Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppTheme.tertiaryColor),
                              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0), // Set your desired border radius
                                ),
                              ),
                                fixedSize: MaterialStateProperty.all(Size(size.width/2.6, 50))

                            ),
                            onPressed: () {
                              // Do something with the entered text
                              print('Entered Text:');
                            },
                            child: Text('Rp.40.000', style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            )),

                          ),
                          SizedBox(width: size.width/20,),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppTheme.tertiaryColor),
                              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0), // Set your desired border radius
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all(Size(size.width/2.6, 50))

                            ),
                            onPressed: () {
                              // Do something with the entered text
                              print('Entered Text:');
                            },
                            child: Text('Rp.50.000', style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            )),


                          ),
                        ],
                      ),
                    ), Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppTheme.tertiaryColor),
                              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0), // Set your desired border radius
                                ),
                              ),
                                fixedSize: MaterialStateProperty.all(Size(size.width/2.6, 50))

                            ),
                            onPressed: () {
                              // Do something with the entered text
                              print('Entered Text:');
                            },
                            child: Text('Rp.60.000', style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            )),

                          ),
                          SizedBox(width: size.width/20,),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppTheme.tertiaryColor),
                              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0), // Set your desired border radius
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all(Size(size.width/2.6, 50))

                            ),
                            onPressed: () {
                              // Do something with the entered text
                              print('Entered Text:');
                            },
                            child: Text('Rp.70.000', style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            )),


                          ),
                        ],
                      ),
                    ), Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppTheme.tertiaryColor),
                              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0), // Set your desired border radius
                                ),
                              ),
                                fixedSize: MaterialStateProperty.all(Size(size.width/2.6, 50))

                            ),
                            onPressed: () {
                              // Do something with the entered text
                              print('Entered Text:');
                            },
                            child: Text('Rp.80.000', style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            )),

                          ),
                          SizedBox(width: size.width/20,),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppTheme.tertiaryColor),
                              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0), // Set your desired border radius
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all(Size(size.width/2.6, 50))

                            ),
                            onPressed: () {
                              // Do something with the entered text
                              print('Entered Text:');
                            },
                            child: Text('Rp.100.000', style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            )),


                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Tambahkan logika yang diinginkan saat tombol ditekan
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TransactionPaymentMethodScreen(fundraise: fundraise),
                ));
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
              'Lanjut',
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

  Widget _buildInfoColumn(String label, String value, IconData iconData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              iconData,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(width: 8.0),
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Text(value),
      ],
    );
  }
}
