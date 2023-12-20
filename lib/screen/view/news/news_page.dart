import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/navigation/navigation.dart';
import 'package:flutter_raih_peduli/screen/view/news/news_search.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_navigation.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';
import '../../view_model/view_model_news.dart';
import 'news_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late final NewsViewModel viewModel;
  late SignInViewModel sp;
  late NavigationProvider navigationProvider;
  @override
  void initState() {
    navigationProvider =
        Provider.of<NavigationProvider>(context, listen: false);
    viewModel = Provider.of<NewsViewModel>(context, listen: false);
    // viewModel.fetchAllNews();
    sp = Provider.of<SignInViewModel>(context, listen: false);
    viewModel.awal();
    sp.setSudahLogin();
    viewModel.scrollController.addListener(() {
      viewModel.scrollListener(
          accessToken: sp.accessTokenSharedPreference,
          refreshToken: sp.refreshTokenSharedPreference);
    });
    viewModel.fetchNewsPagination(
        accessToken: sp.accessTokenSharedPreference,
        refreshToken: sp.refreshTokenSharedPreference);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Berita',
          style: TextStyle(
              color: AppTheme.primaryColor,
              fontFamily: 'Helvetica',
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppTheme.primaryColor,
          ),
          onPressed: () {
            navigationProvider.out();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomNavgationBarWidget(),
              ),
            );
            viewModel.search.clear();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: viewModel.search,
                        decoration: InputDecoration(
                          hintText: 'Cari ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 16.0,
                          ),
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () async {
                              final String query = viewModel.search.text;
                              // viewModel.search.clear();
                              await viewModel.fetchSearchNews(
                                query: query,
                                accessToken: sp.accessTokenSharedPreference,
                                refreshToken: sp.refreshTokenSharedPreference,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<NewsViewModel>(
            builder: (context, contactModel, child) {
              return viewModel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : viewModel.isSearch
                      ? viewModel.isLoadingSearch
                          ? const SizedBox(
                              height: 0,
                            )
                          : Column(
                              children: [
                                if (viewModel.dataHasilSearch)
                                  const Center(
                                    child: Text(
                                      'Pencarian Tidak Ditemukan',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                else if (!viewModel.dataHasilSearch)
                                  for (var newsItem
                                      in viewModel.modelNews!.data)
                                    NewsSearch(
                                      newsData: newsItem,
                                      loginBookmark: sp.isSudahLogin,
                                    )
                              ],
                            )
                      : SizedBox(
                          height: size.height / 1.3,
                          child: ListView.builder(
                            controller: viewModel.scrollController,
                            itemCount:
                                viewModel.modelNewsPagination!.data.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 120,
                                child: NewsCard(
                                  newsData: viewModel
                                      .modelNewsPagination!.data[index],
                                  loginBookmark: sp.isSudahLogin,
                                ),
                              );
                            },
                          ),
                        );
            },
          ),
        ),
      ),
    );
  }
}
