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
  late ViewModelBookmark viewModel;
  late SignInViewModel sp;
  @override
  void initState() {
    viewModel = Provider.of<ViewModelBookmark>(context, listen: false);
    sp = Provider.of<SignInViewModel>(context, listen: false);
    viewModel.getBookmark(
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
            Icons.arrow_back,
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
                        selectedFilter: viewModel.selectedFilter,
                        onFilterSelected: viewModel.setFilter,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Consumer<ViewModelBookmark>(
                    builder: (context, viewMode, child) {
                      if (viewModel.isLoading == true) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (viewModel.bookmarkModel!.data.fundraise.isEmpty &&
                            viewModel.bookmarkModel!.data.news.isEmpty  &&
                            viewModel.bookmarkModel!.data.vacancy.isEmpty) {
                          return Center(
                            child: Text("Tidak ada wishlist"),
                          );
                        } else {
                          if (viewModel.selectedFilter == "Donasi") {
                            return DonasiListView(
                              fundraiseData:
                                  viewModel.bookmarkModel!.data.fundraise!,
                            );
                          } else if (viewModel.selectedFilter == 'Relawan') {
                            return RelawanListView(
                              volunteerData:
                                  viewModel.bookmarkModel!.data.vacancy!,
                            );
                          } else if (viewModel.selectedFilter == 'News') {
                            return NewsListView(newsData: viewModel.bookmarkModel!.data.news!);
                          } else if (viewModel.selectedFilter == 'Semua') {
                            return SemuaListViewBuilder(
                              volunteerData:
                                  viewModel.bookmarkModel!.data.vacancy!,
                              fundraiseData:
                                  viewModel.bookmarkModel!.data.fundraise!,
                              newsData: viewModel.bookmarkModel!.data.news!,
                            );
                          }
                        }
                      }

                      return Center(
                        child: Text("Tidak ada wishlist"),
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
