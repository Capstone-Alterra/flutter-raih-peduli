import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/fundraising_data.dart';
import 'package:flutter_raih_peduli/screen/view/bookmark/widget/save_widget.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DonasiCard extends StatelessWidget {
  final FundraisingData fundraisingData;

  const DonasiCard({
    super.key,
    required this.fundraisingData,
  });

  @override
  Widget build(BuildContext context) {
    final progressValue = fundraisingData.progress / fundraisingData.target;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rounded rectangle container for the image
          Container(
            width: 140,
            height: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              // You can set a background color for the rounded rectangle
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
                left: 10.0,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Image.network(
                  fundraisingData.imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Padding for spacing
          const SizedBox(width: 8.0),
          // Data
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fundraisingData.title,
                              style: const TextStyle(
                                color: AppTheme.primaryColor,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(fundraisingData.time),
                            ),
                          ],
                        ),
                      ),
                      // Bookmark widget
                      SaveWidget(),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: LinearProgressIndicator(
                      value: progressValue,
                      color: AppTheme.primaryColor,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text('Target'),
                            const SizedBox(width: 3),
                            SvgPicture.asset(
                              'assets/target.svg',
                              height: 15,
                            ),
                          ],
                        ),
                        const SizedBox(width: 8.0),
                        Row(
                          children: [
                            const Text('Sisa Hari'),
                            const SizedBox(width: 3),
                            SvgPicture.asset(
                              'assets/tanggal.svg',
                              height: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rp. ${fundraisingData.target}',
                          style: const TextStyle(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          '${fundraisingData.remainingDays} Hari',
                          style: const TextStyle(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
