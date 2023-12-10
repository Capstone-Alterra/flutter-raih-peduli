// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme.dart';

class NewsDetailPage extends StatelessWidget {
  String? foto;
  String? title;
  String? description;

  NewsDetailPage({
    this.foto,
    this.title,
    this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text('Detail Berita'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppTheme.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  foto ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                title ?? "",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF293066),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                description ?? "",
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
