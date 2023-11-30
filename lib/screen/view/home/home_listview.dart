import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/fundraising_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/news_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/viewall_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/volunteer_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_news.dart';
import 'package:provider/provider.dart';

import '../../view_model/view_model_volunteer.dart';
import '../news/news_page.dart';
import '../volunteer/access_volunteer_screen.dart';

class HomeListViewBuilder extends StatefulWidget {
  const HomeListViewBuilder({super.key});

  @override
  State<HomeListViewBuilder> createState() => _HomeListViewBuilderState();
}

class _HomeListViewBuilderState extends State<HomeListViewBuilder> {
  late NewsViewModel viewModelNews;
  late FundraisesViewModel viewModelFundraises;
  late VolunteerViewModel viewModelVolunteer;
  @override
  void initState() {
    viewModelFundraises =
        Provider.of<FundraisesViewModel>(context, listen: false);
    viewModelVolunteer =
        Provider.of<VolunteerViewModel>(context, listen: false);
    viewModelNews = Provider.of<NewsViewModel>(context, listen: false);
    viewModelFundraises.fetchAllFundraises();
    viewModelVolunteer.fetchAllVolunteer();
    viewModelNews.fetchAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            return viewModelFundraises.isLoading
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
                              fundraiseData: viewModelFundraises
                                  .modelFundraises!.data[index],
                       
                            ),
                          ),
                      ],
                    ),
                  );
          },
        ),
        const SizedBox(height: 20),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AccessVolunteerScreen(),
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
        Consumer<VolunteerViewModel>(
          builder: (context, viewMode, child) {
            return viewModelFundraises.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: size.width / 1.975,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var index = 0;
                            index <
                                viewModelVolunteer.modelVolunteer!.data.length;
                            index++)
                          SizedBox(
                            width: size.width / 1.975,
                            child: VolunteerCard(
                                volunteerData: viewModelVolunteer
                                    .modelVolunteer!.data[index]
                                ),
                          ),
                      ],
                    ),
                  );
          },
        ),
        const SizedBox(height: 20),
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
            return viewModelNews.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: size.width / 1.975,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var index = 0;
                            index < viewModelNews.modelNews!.data.length;
                            index++)
                          SizedBox(
                            width: size.width / 1.975,
                            child: NewsCard(
                            newsData: viewModelNews
                                    .modelNews!.data[index]
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
