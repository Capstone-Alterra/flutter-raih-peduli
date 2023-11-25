import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/News/widget/news.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_news_model.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _HomePageState();
}

class _HomePageState extends State<NewsPage> {
  TextEditingController searchController = TextEditingController(text: '');

  void _showFilterBottomSheet(BuildContext context, NewsProvider news) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 9,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // Updated this line
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 170),
                        child: Text(
                          'Filter',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  _buildFilterOption('Lokasi', [
                    'Jabodetabek',
                    'Bandung',
                    'Semarang',
                    'Medan',
                    'Surabaya',
                    'Lampung'
                  ]),
                  _buildFilterOption('Skill Yang Di perlukan',
                      ['Pendidikan', 'Teknologi', 'Kesehatan', 'Komunikasi']),
                  _buildFilterOption(
                      'Partisipan Agensi', ['50 - 70', '80 - 90', '100 - 120']),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Simpan Filters'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: options.map((option) {
            return FilterChip(
              label: Text(option),
              onSelected: (bool selected) {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              selected: false,
              selectedColor: Colors.blue,
              checkmarkColor: Colors.white,
            );
          }).toList(),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Future<void> getNews() async {
    await Provider.of<NewsProvider>(context, listen: false).getTopNews();
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
                                  vertical: 10.0, horizontal: 16.0),
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
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    news.isDataEmpty
                        ? const SizedBox()
                        : news.isloadingSearch
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Column(
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
                    news.isloading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
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
