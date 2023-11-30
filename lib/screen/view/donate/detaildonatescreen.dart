import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_fundraising.dart';
import 'package:flutter_raih_peduli/model/volunteer_data.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/donate/widget_backbutton.dart';
import 'package:flutter_raih_peduli/theme/theme.dart';

class DetailDonateScreen extends StatefulWidget {
  final ModelFundraising? modelFundraising;
  final VolunteerData? volunteerData;

  const DetailDonateScreen(
      {Key? key, this.modelFundraising, this.volunteerData})
      : super(key: key);

  @override
  State<DetailDonateScreen> createState() => _DetailDonateScreenState();
}

class _DetailDonateScreenState extends State<DetailDonateScreen> {
  @override
  Widget build(BuildContext context) {
    final ModelFundraising? modelFundraising = widget.modelFundraising;
    final VolunteerData? volunteerData = widget.volunteerData;

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
              modelFundraising!.photo.toString(),
              height: 200,
            ),
            const SizedBox(height: 16.0),
            Text(
              modelFundraising.title.toString(),
              style: const TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '${modelFundraising.startDate} - ${modelFundraising.endDate}',
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
                value: modelFundraising.status / modelFundraising.target,
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
                  'Rp. ${modelFundraising.target}',
                  style: const TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  '${modelFundraising.endDate - modelFundraising.startDate} Hari',
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
                  volunteerData?.imageUrl ?? '',
                  height: 50,
                ),
                const SizedBox(width: 10.0),
                Text(
                  volunteerData?.title ?? '',
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
              modelFundraising.description.toString(),
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
