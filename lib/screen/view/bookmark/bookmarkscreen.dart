// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
// import 'package:flutter_raih_peduli/screen/view/bookmark/bookmark_listview.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/donasi_listview.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/filter_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/news_listview.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/relawan_listview.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/semua_listview.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmark.dart';
// import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmarkscreen.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  late ViewModelBookmark viewModelBookmark;
  late SignInViewModel sp;
  @override
  void initState() {
    viewModelBookmark = Provider.of<ViewModelBookmark>(context, listen: false);
    sp = Provider.of<SignInViewModel>(context, listen: false);
    viewModelBookmark.getBookmark(
      accessToken: sp.accessTokenSharedPreference,
      refreshToken: sp.refreshTokenSharedPreference,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Disimpan',
          style: TextStyle(
              color: AppTheme.primaryColor,
              fontFamily: 'Helvetica',
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<ViewModelBookmark>(
        builder: (context, contactModel, child) {
          return SingleChildScrollView(
            controller: ScrollController(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Consumer<ViewModelBookmark>(
                    builder: (context, viewMode, child) {
                      return FilterWidget(
                        selectedFilter: viewModelBookmark.selectedFilter,
                        onFilterSelected: viewModelBookmark.setFilter,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Consumer<ViewModelBookmark>(
                    builder: (context, viewMode, child) {
                      if (viewModelBookmark.isLoading == true) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (viewModelBookmark
                                .bookmarkModel!.data.fundraise.isEmpty &&
                            viewModelBookmark
                                .bookmarkModel!.data.news.isEmpty &&
                            viewModelBookmark
                                .bookmarkModel!.data.vacancy.isEmpty) {
                          return Center(
                              child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                'Bookmark Kosong',
                                style: TextStyle(
                                  color:
                                      AppTheme.tertiaryColor.withOpacity(0.9),
                                  fontFamily: 'Helvetica',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ));
                        } else {
                          if (viewModelBookmark.selectedFilter == "Donasi") {
                            return DonasiListView(
                              fundraiseData: viewModelBookmark
                                  .bookmarkModel!.data.fundraise,
                            );
                          } else if (viewModelBookmark.selectedFilter ==
                              'Relawan') {
                            return RelawanListView(
                              volunteerData:
                                  viewModelBookmark.bookmarkModel!.data.vacancy,
                            );
                          } else if (viewModelBookmark.selectedFilter ==
                              'News') {
                            return NewsListView(
                                newsData:
                                    viewModelBookmark.bookmarkModel!.data.news);
                          } else if (viewModelBookmark.selectedFilter ==
                              'Semua') {
                            return SemuaListViewBuilder(
                              volunteerData:
                                  viewModelBookmark.bookmarkModel!.data.vacancy,
                              fundraiseData: viewModelBookmark
                                  .bookmarkModel!.data.fundraise,
                              newsData:
                                  viewModelBookmark.bookmarkModel!.data.news,
                            );
                          }
                        }
                      }
                      return const Center(
                        child: Text("Tidak ada bookmark"),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
