import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/fundraising_data.dart';
import 'package:flutter_raih_peduli/model/news_data.dart';
import 'package:flutter_raih_peduli/model/volunteer_data.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/fundraising_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/news_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/viewall_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/volunteer_card_widget.dart';

class HomeListViewBuilder extends StatelessWidget {
  const HomeListViewBuilder({super.key});

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
                      // Misalnya, menavigasi ke halaman "Lihat Semua"
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
                      fontSize: 15,
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
        // SizedBox(
        //   height: 260, // Set a reasonable height
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: dummyNewsData.length,
        //     itemBuilder: (context, index) {
        //       return SizedBox(
        //         width: 250, // Set a reasonable width for each card
        //         child: NewsCard(
        //           newsData: dummyNewsData[index],
        //         ),
        //       );
        //     },
        //   ),
        // ),
        SizedBox(
          height: size.width / 1.975,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var index = 0; index < dummyNewsData.length; index++)
                SizedBox(
                  width: size.width / 1.975,
                  child: NewsCard(
                    newsData: dummyNewsData[index],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
