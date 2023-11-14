import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/volunteer_data.dart';
import 'package:flutter_raih_peduli/screen/view/home/bookmark_widget.dart';
import 'package:flutter_raih_peduli/theme.dart';

class VolunteerCard extends StatelessWidget {
  final VolunteerData volunteerData;

  const VolunteerCard({
    required this.volunteerData,
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
                  volunteerData.imageUrl,
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
                                  volunteerData.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                // Bookmark widget
                                BookmarkWidget(),
                              ],
                            ),
                            const SizedBox(
                                height: 10.0), // Jarak antara judul dan periode
                            Text(volunteerData.period),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  LinearProgressIndicator(
                    value: volunteerData.progress / volunteerData.slot,
                    color: AppTheme.primaryColor,
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
                          Text(volunteerData.region),
                          Image.asset(
                            'assets/icons/location.png', // Ganti dengan path ke asset yang sesuai
                            height: 20,
                          ),
                        ],
                      ),
                      const SizedBox(width: 8.0),
                      // Sisa Hari
                      Row(
                        children: [
                          const Text('Slot'),
                          Image.asset(
                            'assets/icons/people.png', // Ganti dengan path ke asset yang sesuai
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
                      Text(
                        volunteerData.location,
                        style: const TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        '${volunteerData.slot} Orang',  
                        style: const TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
