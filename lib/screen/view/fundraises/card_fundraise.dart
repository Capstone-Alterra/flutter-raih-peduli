// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'detail_fundraise.dart';

class CardFundraise extends StatelessWidget {
  final Datum fundraise;

  const CardFundraise({super.key, required this.fundraise});

  @override
  Widget build(BuildContext context) {
    final viewModelBookmark =
    Provider.of<ViewModelBookmark>(context, listen: false);
    final viewModelFundraise =
    Provider.of<FundraisesViewModel>(context, listen: false);
    final sp =
    Provider.of<SignInViewModel>(context, listen: false);
    var formatter = NumberFormat("#,##0", "en_US");
    Size size = MediaQuery.of(context).size;
    return GestureDetector(onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailFundraisePage(
            id: fundraise.id,
          ),
        ),
      );
    }, child:
        Consumer<FundraisesViewModel>(builder: (context, contactModel, child) {
      return Card(
        color: AppTheme.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width / 3,
              height: size.width / 2,
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
                    fundraise.photo,
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
                          viewModelFundraise.truncateText(fundraise.title, 15),
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold,
                            fontSize: size.height / 50,
                          ),
                        ),
                        SaveWidgetFixed(bookmarkId: fundraise.bookmarkId, onPressed: () async {
                          if (fundraise.bookmarkId != "") {
                            await viewModelBookmark.deleteBookmark(
                                accessToken: sp.accessTokenSharedPreference,
                                refreshToken: sp.refreshTokenSharedPreference,
                                idBookmark:
                                fundraise.bookmarkId);
                            viewModelFundraise.fetchAllFundraisesPagination(
                                accessToken: sp.accessTokenSharedPreference,
                                refreshToken: sp.refreshTokenSharedPreference);
                           } else if (fundraise.bookmarkId ==
                              "") {
                            await viewModelBookmark.postBookmark(
                                accessToken: sp.accessTokenSharedPreference,
                                refreshToken: sp.refreshTokenSharedPreference,
                                id: fundraise.id,
                                postType: 'fundraise');
                            viewModelFundraise.fetchAllFundraisesPagination(
                                accessToken: sp.accessTokenSharedPreference,
                                refreshToken: sp.refreshTokenSharedPreference);
                            }
                        },),
                      ],
                    ),
                    // const SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/jam.svg',
                                  ),
                                  Text(
                                    "Sisa hari",
                                    style: TextStyle(
                                      color: AppTheme.primaryColor,
                                      fontFamily: 'Helvetica',
                                      fontSize: size.height / 60,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                fundraise.endDate
                                            .difference(DateTime.now())
                                            .inDays >=
                                        0
                                    ? '${fundraise.endDate.difference(DateTime.now()).inDays} Hari'
                                    : "Waktu Donasi Habis",
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontFamily: 'Helvetica',
                                  fontSize: size.height / 70,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/target_panah.svg',
                                  ),
                                  Text(
                                    "Target",
                                    style: TextStyle(
                                      color: const Color(0xFF959CB4),
                                      fontFamily: 'Helvetica',
                                      fontSize: size.height / 60,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Rp. ${formatter.format(fundraise.target)}',
                                style: TextStyle(
                                  color: const Color(0xFF959CB4),
                                  fontFamily: 'Helvetica',
                                  fontSize: size.height / 70,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Divider(thickness: 1.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rp ${formatter.format(fundraise.fundAcquired)}",
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontFamily: 'Helvetica',
                              fontSize: size.height / 70,
                            ),
                          ),
                          Container(
                            height: 15,
                            width: 45,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD1DAEC),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  16.0,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "${((fundraise.fundAcquired / fundraise.target) * 100).toStringAsFixed(2)} %",
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontFamily: 'Helvetica',
                                  fontSize: size.height / 80,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 5.0),
                      child: LinearProgressIndicator(
                        color: AppTheme.tertiaryColor,
                        value: (fundraise.fundAcquired / fundraise.target)
                            .toDouble(),
                        minHeight: 10,
                        borderRadius:
                          const  BorderRadius.all(Radius.circular(10)), // Set the
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }
}
