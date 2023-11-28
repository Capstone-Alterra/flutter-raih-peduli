import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/volunteer_data.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/donate/widget_backbutton.dart';
import 'package:flutter_raih_peduli/theme/theme.dart';
import 'package:flutter_raih_peduli/model/donate_data.dart';

class DetailDonateScreen extends StatefulWidget {
  final FundraisingData? fundraisingData;

  const DetailDonateScreen({Key? key, this.fundraisingData}) : super(key: key);

  @override
  State<DetailDonateScreen> createState() => _DetailDonateScreenState();
}

class _DetailDonateScreenState extends State<DetailDonateScreen> {
  @override
  Widget build(BuildContext context) {
    final FundraisingData? fundraisingData = widget.fundraisingData;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Detail Penggalangan Dana',
          style: TextStyle(
              color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const BackButtonWidget(),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              fundraisingData!.imageUrl,
              height: 200,
            ),
            const SizedBox(height: 16.0),
            Text(
              fundraisingData.title,
              style: const TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              fundraisingData.time,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8.0),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              child: LinearProgressIndicator(
                minHeight: 9,
                value: fundraisingData.progress / fundraisingData.target,
                color: AppTheme.primaryColor,
                backgroundColor: Colors.grey,
              ),
            ),

            const SizedBox(height: 16.0),

            // Row Target
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Target',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  'Sisa Hari',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rp. ${fundraisingData.target}',
                  style: const TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  '${fundraisingData.remainingDays} Hari',
                  style: const TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16.0),

            const Text(
              'Penggalangan Dana',
              style: TextStyle(
                color: AppTheme.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  dummyVolunteerData[0].imageUrl,
                  height: 50,
                ),
                const SizedBox(width: 10.0),
                Text(
                  dummyVolunteerData[0].title,
                  style: const TextStyle(
                    color: AppTheme.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16.0),

            const Text(
              'Deskripsi',
              style: TextStyle(
                color: AppTheme.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              fundraisingData.description,
              style: const TextStyle(
                color: AppTheme.black,
                fontSize: 14,
              ),
            ),

            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => (),
                //   ),
                // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              child: const Text(
                'Donasi Sekarang',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Helvetica',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
