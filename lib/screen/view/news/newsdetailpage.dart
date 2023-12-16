// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

import '../../view_model/view_model_news.dart';

class NewsDetailPage extends StatefulWidget {
  int id;

  NewsDetailPage({
    required this.id,
    super.key,
  });

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  late NewsViewModel viewModel;
  @override
  void initState() {
    viewModel = Provider.of<NewsViewModel>(context, listen: false);
    viewModel.fetchDetailNews(
      id: widget.id,
    );
    super.initState();
  }

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
      body: Consumer<NewsViewModel>(
        builder: (context, contactModel, child) {
          return viewModel.isLoadingDetail
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            viewModel.modelDetailNews!.data.photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          viewModel.modelDetailNews!.data.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF293066),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          viewModel.modelDetailNews!.data.description,
                          maxLines: null,
                          style: const TextStyle(
                            color: Color(0xFF293066),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
