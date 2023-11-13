import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/fundraising_data.dart';
import 'package:flutter_raih_peduli/model/news_data.dart';
import 'package:flutter_raih_peduli/model/volunteer_data.dart';
import 'package:flutter_raih_peduli/screen/view/home/fundraising_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view/home/volunteer_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view/home/news_card_widget.dart';

class HomeListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Donasi',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 400,
          child: ListView.builder(
            itemCount: dummyFundraisingData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: FundraisingCard(
                  fundraisingData: dummyFundraisingData[index],
                  bookmarkWidget: const SizedBox(),
                ),
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Voluntir',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: dummyVolunteerData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: VolunteerCard(
                  volunteerData: dummyVolunteerData[index],
                ),
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Berita',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: dummyNewsData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NewsCard(
                  newsData: dummyNewsData[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
