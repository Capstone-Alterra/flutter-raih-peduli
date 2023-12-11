import 'package:flutter/material.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/transaction_amount_screen.dart';
import 'package:flutter_raih_peduli/screen/view/home/homescreen.dart';

// import 'package:flutter_raih_peduli/screen/view/volunteer/form_apply.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_transaction.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';

class PaymentQrisPage extends StatelessWidget {
  // final Datum fundraise;
  const PaymentQrisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _flutterMediaDownloaderPlugin = MediaDownload();
    final viewModelFundraise = Provider.of<FundraisesViewModel>(context, listen: false);
    final viewModelTransaction = Provider.of<TransactionViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<TransactionViewModel>(builder: (context, isLoading, child) {
          return viewModelTransaction.isLoading
              ? Text('') : Text(
            viewModelTransaction.modelTransaction!.data.paymentType,
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontFamily: 'Helvetica',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          );}),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(child:
          Consumer<TransactionViewModel>(builder: (context, isLoading, child) {
        return viewModelTransaction.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Banner Image
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      // Sesuaikan dengan kebutuhan
                      child: Image.network(
                        viewModelTransaction.modelTransaction!.data.urlCallback,
                        height: 350.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Volunteer Title

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
                              Text(
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
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontFamily: 'Helvetica',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Valid Until',
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontFamily: 'Helvetica',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '01-03-2023',
                                style: TextStyle(
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
      })),
      bottomNavigationBar:  Consumer<TransactionViewModel>(builder: (context, isLoading, child) {
      return viewModelTransaction.isLoading
          ? Text('')
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () async {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
              (route) => false,
            );
            // _flutterMediaDownloaderPlugin.downloadMedia(context,'assets/dummy_qris.png');
            viewModelFundraise.amountController.clear();
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
              'Simpan Kode QR',
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
