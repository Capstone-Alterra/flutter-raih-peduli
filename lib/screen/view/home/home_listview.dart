import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/fundraising_data.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/access_volunteer_screen.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/fundraising_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/news_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/viewall_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/volunteer_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_news.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer.dart';
import 'package:provider/provider.dart';

import '../news/news_page.dart';

class HomeListViewBuilder extends StatelessWidget {
  const HomeListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModelVolunteer =
        Provider.of<VolunteerViewModel>(context, listen: false);
    final viewModelNews = Provider.of<NewsViewModel>(context, listen: false);
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Helvetica'),
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
        SizedBox(
          height: 260, // Set a reasonable height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyFundraisingData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250, // Set a reasonable width for each card
                  child: FundraisingCard(
                    fundraisingData: dummyFundraisingData[index],
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
                    'Jadilah Relawan Sosial',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica',
                    ),
                  ),
                  ViewallWidget(
                    onPressed: () {
                      // Aksi yang akan dijalankan saat tombol ditekan
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
        Consumer<VolunteerViewModel>(
          builder: (context, isLoading, child) {
            return viewModelVolunteer.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: size.width / 1.975, // Set a reasonable height
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModelVolunteer.modelVolunteer!.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: size.width / 1.975, // Set a reasonable width for each card
                            child: VolunteerCard(
                                volunteerData: viewModelVolunteer
                                    .modelVolunteer!.data[index]),
                          ),
                        );
                      },
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
                              title: viewModelNews.modelNews!.data[index].title,
                              description: viewModelNews
                                  .modelNews!.data[index].description,
                              imageUrl:
                                  viewModelNews.modelNews!.data[index].photo,
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
