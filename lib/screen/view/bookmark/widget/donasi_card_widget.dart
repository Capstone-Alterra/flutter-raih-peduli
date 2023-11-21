import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/fundraising_data.dart';
import 'package:flutter_raih_peduli/screen/view/bookmark/widget/save_widget.dart';
import 'package:flutter_raih_peduli/theme/theme.dart';

class DonasiCard extends StatelessWidget {
  final FundraisingData fundraisingData;

  const DonasiCard({super.key, 
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
                left: 10.0, // Padding di sebelah kiri
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
          const SizedBox(width: 3.0),
          // Data
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              textBaseline: TextBaseline.alphabetic,
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
                                // Bookmark widget
                                const SaveWidget(),
                              ],
                            ),

                            const SizedBox(
                                height: 10.0), // Jarak antara judul dan periode
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(fundraisingData.time),
                            ),
                          ],
                        ),
                      ),
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
                  // Baris untuk ikon, tulisan target, dan sisa hari
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Target
                        Row(
                          children: [
                            const Text('Target'),
                            Image.asset(
                              'assets/icons/target.png', // Ganti dengan path ke asset yang sesuai
                              height: 20,
                            ),
                          ],
                        ),
                        const SizedBox(width: 8.0),
                        // Sisa Hari
                        Row(
                          children: [
                            const Text('Sisa Hari'),
                            Image.asset(
                              'assets/icons/days.png', // Ganti dengan path ke asset yang sesuai
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  // Baris untuk nilai atau value
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
                        const SizedBox(
                            width:
                                8.0), // Berikan ruang di antara nilai target dan sisa hari
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
