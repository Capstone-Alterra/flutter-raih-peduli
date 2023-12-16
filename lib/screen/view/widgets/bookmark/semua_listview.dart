import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/card_fundraise_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/card_news_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/card_relawan_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmark.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

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
    final viewModelBookmark =
    Provider.of<ViewModelBookmark>(context, listen: false);
    return Column(
      children: [
        viewModelBookmark.bookmarkModel!.data.fundraise.isEmpty? SizedBox(width: 1,) :
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 8, bottom: 16),
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
        viewModelBookmark.bookmarkModel!.data.vacancy.isEmpty? SizedBox(width: 1,) :
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 8, bottom: 16),
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
        viewModelBookmark.bookmarkModel!.data.news.isEmpty? SizedBox(width: 1,) :
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 8, bottom: 16),
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
