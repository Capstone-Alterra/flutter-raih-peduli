import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/volunteer_data.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/fundraising_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/news_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/viewall_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/volunteer_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_news.dart';
import 'package:provider/provider.dart';

import '../news/news_page.dart';

class HomeListViewBuilder extends StatefulWidget {
  const HomeListViewBuilder({super.key});

  @override
  State<HomeListViewBuilder> createState() => _HomeListViewBuilderState();
}

class _HomeListViewBuilderState extends State<HomeListViewBuilder> {
  late NewsViewModel viewModel;
  late FundraisesViewModel viewModelFundraises;
  @override
  void initState() {
    viewModel = Provider.of<NewsViewModel>(context, listen: false);
    viewModelFundraises =
        Provider.of<FundraisesViewModel>(context, listen: false);
    viewModelFundraises.fetchAllFundraises();
    viewModel.fetchAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Donasi Untuk Kebaikan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica',
                    ),
                  ),
                  ViewallWidget(
                    onPressed: () {
                      // Aksi yang akan dijalankan saat tombol ditekan
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        Consumer<FundraisesViewModel>(
          builder: (context, viewMode, child) {
            return viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: size.width / 1.975,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var index = 0;
                            index <
                                viewModelFundraises
                                    .modelFundraises!.data.length;
                            index++)
                          SizedBox(
                            width: size.width / 1.975,
                            child: FundraisingCard(
                              title: viewModelFundraises
                                  .modelFundraises!.data[index].title,
                              description: viewModelFundraises
                                  .modelFundraises!.data[index].description,
                              imageUrl: viewModelFundraises
                                  .modelFundraises!.data[index].photo,
                              target: viewModelFundraises
                                  .modelFundraises!.data[index].target,
                            ),
                          ),
                      ],
                    ),
                  );
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Jadilah Relawan Sosial',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica',
                    ),
                  ),
                  ViewallWidget(
                    onPressed: () {
                      // Aksi yang akan dijalankan saat tombol ditekan
                      // Misalnya, menavigasi ke halaman "Lihat Semua"
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 2.5),
        SizedBox(
          height: 260, // Set a reasonable height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyVolunteerData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250, // Set a reasonable width for each card
                  child: VolunteerCard(
                    volunteerData: dummyVolunteerData[index],
                  ),
                ),
              );
            },
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Temukan Informasi Terkini',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica',
                    ),
                  ),
                  ViewallWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewsPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 2.5),
        Consumer<NewsViewModel>(
          builder: (context, viewMode, child) {
            return viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: size.width / 1.975,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var index = 0;
                            index < viewModel.modelNews!.data.length;
                            index++)
                          SizedBox(
                            width: size.width / 1.975,
                            child: NewsCard(
                              title: viewModel.modelNews!.data[index].title,
                              description:
                                  viewModel.modelNews!.data[index].description,
                              imageUrl: viewModel.modelNews!.data[index].photo,
                            ),
                          ),
                      ],
                    ),
                  );
          },
        ),
      ],
    );
  }
}
