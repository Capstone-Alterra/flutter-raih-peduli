// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/news/news_page.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
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
  late NewsViewModel viewModelNews;
  late SignInViewModel sp;
  @override
  void initState() {
    viewModelNews = Provider.of<NewsViewModel>(context, listen: false);
    sp = Provider.of<SignInViewModel>(context, listen: false);
    viewModelNews.fetchDetailNews(
      id: widget.id,
        accessToken: sp.accessTokenSharedPreference,
        refreshToken: sp.refreshTokenSharedPreference);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModelBookmark =
    Provider.of<ViewModelBookmark>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text('Detail Berita', style: TextStyle(
          color: AppTheme.primaryColor,
          fontFamily: 'Helvetica',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppTheme.primaryColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsPage()
              ),
            );
          },
        ),
        actions: [
          Consumer<NewsViewModel>(
              builder: (context, contactModel, child) {
                return SaveWidgetFixed(
                  bookmarkId: viewModelNews.modelDetailNews!.data.bookmarkId,
                  onPressed: () async {
                    if (viewModelNews.modelDetailNews!.data.bookmarkId != "") {
                      await viewModelBookmark.deleteBookmark(
                          accessToken: sp.accessTokenSharedPreference,
                          refreshToken: sp.refreshTokenSharedPreference,
                          idBookmark:
                          viewModelNews.modelDetailNews!.data.bookmarkId);
                      viewModelNews.fetchDetailNews(id: viewModelNews.modelDetailNews!.data.id, accessToken: sp.accessTokenSharedPreference, refreshToken: sp.refreshTokenSharedPreference);
                    } else if (viewModelNews.modelDetailNews!.data.bookmarkId ==
                        "") {
                      await viewModelBookmark.postBookmark(
                          accessToken: sp.accessTokenSharedPreference,
                          refreshToken: sp.refreshTokenSharedPreference,
                          id: viewModelNews.modelDetailNews!.data.id,
                          postType: 'news');
                      viewModelNews.fetchDetailNews(id: viewModelNews.modelDetailNews!.data.id, accessToken: sp.accessTokenSharedPreference, refreshToken: sp.refreshTokenSharedPreference);
                    }
                  },
                );
              }),
        ],
      ),
      body: Consumer<NewsViewModel>(
        builder: (context, contactModel, child) {
          return viewModelNews.isLoadingDetail
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            viewModelNews.modelDetailNews!.data.photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          viewModelNews.modelDetailNews!.data.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF293066),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          viewModelNews.modelDetailNews!.data.description,
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
