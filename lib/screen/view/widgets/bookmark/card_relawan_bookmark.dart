// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_bookmark.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/detail_fundraise.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/detail_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CardRelawanBookmark extends StatelessWidget {
  final Vacancy vacancy;

  const CardRelawanBookmark({super.key, required this.vacancy});

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat("#,##0", "en_US");
    final viewModelFundraise =
        Provider.of<FundraisesViewModel>(context, listen: false);
    final viewModelBookmark =
        Provider.of<ViewModelBookmark>(context, listen: false);
    final sp = Provider.of<SignInViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailVolunteerPage(
              id: vacancy.postId,
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
                    vacancy.photo,
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
                          viewModelFundraise.truncateText(vacancy.title, 17),
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SaveWidgetFixed(
                            bookmarkId: vacancy.bookmarkId,
                            onPressed: () async {
                              if (vacancy.bookmarkId != "") {
                                await viewModelBookmark.deleteBookmark(
                                    accessToken: sp.accessTokenSharedPreference,
                                    refreshToken:
                                        sp.refreshTokenSharedPreference,
                                    idBookmark: vacancy.bookmarkId);
                                viewModelBookmark.getBookmark(
                                  accessToken: sp.accessTokenSharedPreference,
                                  refreshToken: sp.refreshTokenSharedPreference,
                                );
                              } else if (vacancy.bookmarkId == "") {
                                await viewModelBookmark.postBookmark(
                                    accessToken: sp.accessTokenSharedPreference,
                                    refreshToken:
                                        sp.refreshTokenSharedPreference,
                                    id: vacancy.postId,
                                    postType: 'fundraise');
                                viewModelBookmark.getBookmark(
                                  accessToken: sp.accessTokenSharedPreference,
                                  refreshToken: sp.refreshTokenSharedPreference,
                                );
                              }
                            }),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        viewModelFundraise.truncateText(
                          vacancy.description,
                          25,
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Helvetica',
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Divider(thickness: 1.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/lokasi.svg',
                              ),
                              Text(
                                vacancy.province,
                                style: const TextStyle(
                                    color: AppTheme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8.0),
                          Row(
                            children: [
                              Text(
                                'Slot Tersisa',
                                style: TextStyle(
                                    color: AppTheme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              SvgPicture.asset(
                                'assets/orang.svg',
                                height: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            viewModelFundraise.truncateText(vacancy.city, 25),
                            style: TextStyle(
                              color: const Color(0xFF959CB4),
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            '${vacancy.numberOfVacancies}',
                            style: TextStyle(
                              color: const Color(0xFF959CB4),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
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
