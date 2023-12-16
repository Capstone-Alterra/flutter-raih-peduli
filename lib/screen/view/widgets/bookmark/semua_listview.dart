import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/card_fundraise_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/card_news_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/card_relawan_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/save_widget.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../model/model_bookmark.dart';

class SemuaListViewBuilder extends StatelessWidget {
  final List<Vacancy> volunteerData;
  final List<News> newsData;
  final List<Fundraise> fundraiseData;

  const SemuaListViewBuilder({
    super.key,
    required this.volunteerData,
    required this.newsData,
    required this.fundraiseData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 9, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Donasi',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica',
                    ),
                  ),
                ],
              ),
            ),
           for(Fundraise data in fundraiseData)
             CardFundraiseBookmark(fundraise: data)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 20, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Relawan',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica',
                    ),
                  ),
                ],
              ),
            ),
              for (Vacancy data in volunteerData)
                CardRelawanBookmark(vacancy: data)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 20, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Berita',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica',
                    ),
                  ),
                ],
              ),
            ),
              for (News data in newsData)
                CardNewsBookmark(news: data)
          ],
        ),
      ],
    );
  }
}
