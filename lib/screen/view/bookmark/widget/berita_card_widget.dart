import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/news_data.dart';
import 'package:flutter_raih_peduli/theme.dart';

class NewsCard extends StatelessWidget {
  final NewsData newsData;

  const NewsCard({
    Key? key,
    required this.newsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
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
                    newsData.imageUrl,
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
                                newsData.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 25.0),
                              Text(newsData.description),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25.0),
                    // Tombol "Baca Selengkapnya"
                    ElevatedButton(
                      onPressed: () {
                        // Fungsi yang akan dijalankan saat tombol ditekan
                        // Anda dapat menambahkan logika navigasi atau tindakan lainnya di sini
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        padding: const EdgeInsets.symmetric(horizontal: 46.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Text('Baca Selengkapnya'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
