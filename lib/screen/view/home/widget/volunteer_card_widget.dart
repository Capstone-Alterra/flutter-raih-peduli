import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/volunteer_data.dart';
import 'package:flutter_raih_peduli/screen/view/access_volunteer/detail_volunteer.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rounded rectangle container for the image
          Container(
            width: double.infinity,
            height: 125,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                 child: Image.network(
                    volunteerData.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
              ),
            ),
          ),
          // Data
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  volunteerData.title,
                  style: const TextStyle(
                    color: AppTheme.primaryColor,
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  volunteerData.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                            'assets/icons/people.png', 
                            height: 10,
                          ),
                            const Text(
                            'Slot', 
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              color: AppTheme.primaryColor,
                               fontWeight: FontWeight.bold,
                               fontSize: 12
                            ),
                            ),
                          ],
                        ),
                        Text(
                          '${volunteerData.slot} Orang',
                          style: const TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 12
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailVolunteerPage(volunteerData: volunteerData),),
                      );// Aksi yang akan dijalankan saat tombol lihat detail ditekan
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Helvetica',
                          color: AppTheme.white,
                          fontSize: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        fixedSize:
                            const Size(100, 0), // Sesuaikan ukuran sesuai kebutuhan
                      ),
                      child: const Text(
                        'Lihat Detail',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
