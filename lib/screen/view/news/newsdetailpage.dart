import 'package:flutter/material.dart';
import '../../../model/model_news.dart';

class NewsDetailPage extends StatelessWidget {
  final Datum newsData;

  const NewsDetailPage({
    required this.newsData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text('Detail Berita'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(newsData.photo, fit: BoxFit.cover),
              ),
              const SizedBox(height: 10.0),
              Text(
                newsData.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF293066),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                newsData.description,
                maxLines: null,
                style: const TextStyle(
                  color: Color(0xFF293066),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
