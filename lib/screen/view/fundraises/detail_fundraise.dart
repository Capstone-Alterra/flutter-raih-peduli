import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/transaction_amount_screen.dart';
// import 'package:flutter_raih_peduli/screen/view/volunteer/form_apply.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/save_widget.dart';
import 'package:flutter_raih_peduli/theme.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';

class DetailFundraisePage extends StatelessWidget {
  final Datum fundraise;
  const DetailFundraisePage({super.key, required this.fundraise});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detail Penggalangan Dana',
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
        actions: [
          SaveWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner Image
            Container(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(12.0), // Sesuaikan dengan kebutuhan
                child: Image.network(
                  fundraise.photo,
                  height: 250.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Volunteer Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                fundraise.title,
                style: const TextStyle(
                  color: AppTheme.tertiaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child:  Text('12 Desember - 24 Desember', style:  TextStyle(
                fontFamily: 'Helvetica',
                fontSize: size.height / 60
              ),),
            ),const Padding(
              padding: EdgeInsets.only(left: 16.0, top:6, right: 16.0),
              child:  LinearProgressIndicator(
                color: AppTheme.tertiaryColor,
                value: 0.6,
                minHeight: 10, // Set the height of the progress
                borderRadius: BorderRadius.all(Radius.circular(10)), // Set the
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Target",
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w500,
                              fontSize: size.height / 60,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "Rp 5.000.000",
                        style: TextStyle(
                          color: AppTheme.tertiaryColor,
                          fontFamily: 'Helvetica',
                          fontSize: size.height / 50,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Sisa hari",
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontFamily: 'Helvetica',
                              fontSize: size.height / 60,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "12 Hari",
                        style: TextStyle(
                          color: AppTheme.tertiaryColor,
                          fontFamily: 'Helvetica',
                          fontSize: size.height / 50,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                'Penggalang Dana',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0),
              child: Row(

              )
            ),

            // Judul Deskripsi
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                'Deskripsi',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Deskripsi
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                fundraise.description,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),

            // Tombol Ikuti Program
          ],
        ),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Tambahkan logika yang diinginkan saat tombol ditekan
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TransactionAmountScreen(fundraise: fundraise),
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
              'Donasi Sekarang',
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
