import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme.dart';

import '../../../../model/news_data.dart';

class NewsCard extends StatelessWidget {
  final NewsData newsData;

  const NewsCard({
    super.key,
    required this.newsData,
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
                  newsData.imageUrl,
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
                  newsData.title,
                  style: const TextStyle(
                    color: AppTheme.primaryColor,
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  newsData.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppTheme.black,
                    fontFamily: 'Helvetica',
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4.0),
                ElevatedButton(
                  onPressed: () {
                    // Fungsi yang akan dijalankan saat tombol ditekan
                    // Anda dapat menambahkan logika navigasi atau tindakan lainnya di sini
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Helvetica'),
                    backgroundColor: AppTheme.primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Baca Selengkapnya',
                    style: TextStyle(color: AppTheme.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
