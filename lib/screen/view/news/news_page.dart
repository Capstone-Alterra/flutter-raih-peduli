import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/view_model_news.dart';
import 'filter_bottom_sheet.dart';
import 'news.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late final NewsViewModel viewModel;
  @override
  void initState() {
    viewModel = Provider.of<NewsViewModel>(context, listen: false);
    viewModel.fetchAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
                            await viewModel.fetchSearchNews(query: query);
                          },
                        ),
                      ),
                    ),
                  ),
                  Consumer<NewsViewModel>(
                    builder: (context, news, child) {
                      return IconButton(
                        onPressed: () {
                          showFilterBottomSheet(context, news);
                        },
                        icon: const Icon(Icons.filter_alt_outlined),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Consumer<NewsViewModel>(
                builder: (context, contactModel, child) {
                  return viewModel.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            viewModel.dataHasilSearch
                                ? const Text(
                                    'Pencarian Tidak Ditemukan',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.red,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const SizedBox(),
                            for (var newsItem in viewModel.modelNews!.data)
                              News(
                                title: newsItem.title,
                                image: newsItem.photo,
                                description: newsItem.description,
                              )
                          ],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
