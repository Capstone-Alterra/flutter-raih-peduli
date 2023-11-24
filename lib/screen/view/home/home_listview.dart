import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/fundraising_data.dart';
import 'package:flutter_raih_peduli/model/news_data.dart';
import 'package:flutter_raih_peduli/model/volunteer_data.dart';
import 'package:flutter_raih_peduli/screen/view/access_volunteer/access_volunteer_screen.dart';
import 'package:flutter_raih_peduli/screen/view/home/widget/fundraising_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view/home/widget/viewall_widget.dart';
import 'package:flutter_raih_peduli/screen/view/home/widget/volunteer_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view/home/widget/news_card_widget.dart';

class HomeListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Donasi Untuk Kebaikan',
                    style: TextStyle(
                      fontSize: 18,
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
        SizedBox(
          height: 260, // Set a reasonable height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyFundraisingData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
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
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text(
                      'Jadilah Relawan Sosial',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Helvetica',
                      ),
                    ),
                  ViewallWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return AccessVolunteerScreen();
                        }),
                      ); // Aksi yang akan dijalankan saat tombol ditekan
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
                padding: const EdgeInsets.only(left: 8.0),
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
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text(
                      'Temukan Informasi Terkini',
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
            itemCount: dummyNewsData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: 250, // Set a reasonable width for each card
                  child: NewsCard(
                    newsData: dummyNewsData[index],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
