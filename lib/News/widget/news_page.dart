import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/component/news.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_news_model.dart';
import 'package:provider/provider.dart';

import 'filter_bottom_sheet.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _HomePageState();
}

class _HomePageState extends State<NewsPage> {
  TextEditingController searchController = TextEditingController(text: '');

  Future<void> getNews() async {
    await Provider.of<NewsProvider>(context, listen: false).getTopNews();
  }

  void _showFilterBottomSheet(BuildContext context, NewsProvider news) {
    showFilterBottomSheet(context, news);
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (BuildContext context, news, Widget? child) {
        return RefreshIndicator(
          onRefresh: () async {
            news.setLoading(true);
            await getNews();
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: const Text(
                "News",
                style: TextStyle(
                  color: Color.fromARGB(255, 4, 62, 108),
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: searchController,
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
                                onPressed: () {
                                  news.search(searchController.text);
                                },
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _showFilterBottomSheet(context, news);
                          },
                          icon: const Icon(Icons.filter_alt_outlined),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    if (news.isDataEmpty)
                      const SizedBox()
                    else if (news.isloadingSearch)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                    else
                      Column(
                        children: [
                          ...news.resSearch!.articles!.map(
                            (e) => News(
                              title: e.title ?? '',
                              image: e.urlToImage ?? '',
                              description: e.description ?? '',
                            ),
                          )
                        ],
                      ),
                    if (news.isloading)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                    else
                      Column(
                        children: [
                          ...news.resNews!.articles!.map(
                            (e) => News(
                              title: e.title ?? '',
                              image: e.urlToImage ?? '',
                              description: e.description ?? '',
                            ),
                          )
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
