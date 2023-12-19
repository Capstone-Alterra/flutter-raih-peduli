// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/news/newsdetailpage.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_news.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

import '../../../model/model_news.dart';
import '../../../theme.dart';
import '../../view_model/view_model_bookmark.dart';
import '../../view_model/view_model_signin.dart';
import '../widgets/bookmark/save_widget.dart';
import '../widgets/login_signup/alert.dart';

class NewsSearch extends StatefulWidget {
  final Datum newsData;
  final bool loginBookmark;
  const NewsSearch(
      {super.key, required this.newsData, required this.loginBookmark});

  @override
  State<NewsSearch> createState() => _NewsSearchState();
}

class _NewsSearchState extends State<NewsSearch> {
  late SignInViewModel sp;
  @override
  void initState() {
    sp = Provider.of<SignInViewModel>(context, listen: false);
    sp.setSudahLogin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final viewModelBookmark =
        Provider.of<ViewModelBookmark>(context, listen: false);
    final viewModelNews = Provider.of<NewsViewModel>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailPage(
              id: widget.newsData.id,
            ),
          ),
        );
      },
      child: Consumer<NewsViewModel>(builder: (context, contactModel, child) {
        return Card(
          color: AppTheme.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width / 3.3,
                height: size.width / 3.2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    left: 10.0,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: Image.network(
                      widget.newsData.photo,
                      // height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            viewModelNews.truncateText(
                                widget.newsData.title, 15),
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 60,
                            ),
                          ),
                          Consumer<SignInViewModel>(
                            builder: (context, contactModel, child) {
                              if (widget.loginBookmark == true) {
                                return SaveWidgetFixed(
                                  bookmarkId: widget.newsData.bookmarkId,
                                  onPressed: () async {
                                    if (widget.newsData.bookmarkId != "") {
                                      await viewModelBookmark.deleteBookmark(
                                        accessToken:
                                            sp.accessTokenSharedPreference,
                                        refreshToken:
                                            sp.refreshTokenSharedPreference,
                                        idBookmark: widget.newsData.bookmarkId,
                                      );
                                      await viewModelNews.fetchSearchNews(
                                        query: viewModelNews.search.text,
                                        accessToken:
                                            sp.accessTokenSharedPreference,
                                        refreshToken:
                                            sp.refreshTokenSharedPreference,
                                      );
                                    } else
                                    // if (newsData.bookmarkId == "")
                                    {
                                      await viewModelBookmark.postBookmark(
                                        accessToken:
                                            sp.accessTokenSharedPreference,
                                        refreshToken:
                                            sp.refreshTokenSharedPreference,
                                        id: widget.newsData.id,
                                        postType: 'news',
                                      );
                                      await viewModelNews.fetchSearchNews(
                                        query: viewModelNews.search.text,
                                        accessToken:
                                            sp.accessTokenSharedPreference,
                                        refreshToken:
                                            sp.refreshTokenSharedPreference,
                                      );
                                    }
                                  },
                                );
                              } else {
                                return SaveWidgetFixed(
                                  bookmarkId: "",
                                  onPressed: () async {
                                    customAlert(
                                      context: context,
                                      alertType: QuickAlertType.error,
                                      text: 'Anda belum login',
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          viewModelNews.truncateText(
                            widget.newsData.description,
                            100,
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Helvetica',
                            fontSize: size.height / 70,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Divider(thickness: 1.2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
