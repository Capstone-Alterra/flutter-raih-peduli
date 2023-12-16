// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_bookmark.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/detail_fundraise.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/detail_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CardNewsBookmark extends StatelessWidget {
  final News news;
  const CardNewsBookmark({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat("#,##0", "en_US");
    final viewModel = Provider.of<FundraisesViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailVolunteerPage(
              id: news.postId,
            ),
          ),
        );
      },
      child: Card(
        color: AppTheme.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width / 3.2,
              height: size.width / 2.9,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  left: 10.0,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Image.network(
                    news.photo,
                    // height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          viewModel.truncateText(news.title, 18),
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold,
                            fontSize: size.height / 60,
                          ),
                        ),
                        SaveWidget(bookmarkId: news.bookmarkId,),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        viewModel.truncateText(
                          news.description,
                          100,
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Helvetica',
                          fontSize: size.height / 70,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Divider(thickness: 1.2),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
