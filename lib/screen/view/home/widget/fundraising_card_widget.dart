import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/fundraising_data.dart';
import 'package:flutter_raih_peduli/theme.dart';

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
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                 child: Image.network(
                    fundraisingData.imageUrl,
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
                  fundraisingData.title,
                  style: const TextStyle(
                    color: AppTheme.primaryColor,
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  fundraisingData.description,
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
                            'assets/icons/target.png', 
                            height: 10,
                          ),
                            const Text(
                            'Target', 
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                            ),
                            ),
                          ],
                        ),
                        Text(
                          'Rp. ${fundraisingData.target}',
                          style: const TextStyle(
                            color: AppTheme.primaryColor,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Aksi yang akan dijalankan saat tombol lihat detail ditekan
                        // Misalnya, menavigasi ke halaman detail
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Helvetica',),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
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
