import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/fundraising_data.dart';
import 'package:flutter_raih_peduli/screen/view/home/bookmark_widget.dart';

class FundraisingCard extends StatelessWidget {
  final FundraisingData fundraisingData;

  const FundraisingCard({
    required this.fundraisingData,
  });

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fundraisingData.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Text(fundraisingData.period),
                          ],
                        ),
                      ),
                      // Bookmark widget
                      BookmarkWidget(),
                    ],
                  ),

                  const SizedBox(height: 8.0),
                  LinearProgressIndicator(
                    value: fundraisingData.progress / fundraisingData.target,
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(height: 8.0),
                  // Baris untuk ikon, tulisan target, dan sisa hari
                  Row(
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
                  const SizedBox(height: 4.0),
                  // Baris untuk nilai atau value
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${fundraisingData.target}'),
                      const SizedBox(
                          width:
                              8.0), // Berikan ruang di antara nilai target dan sisa hari
                      Text('${fundraisingData.daysLeft} Hari'),
                    ],
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
