import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/detail_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';

import '../../../model/model_volunteer.dart';
import '../widgets/bookmark/save_widget.dart';
import '../widgets/login_signup/alert.dart';

class RelawanCardSearch extends StatelessWidget {
  final Datum volunteerData;
  final bool loginBookmark;

  const RelawanCardSearch({
    super.key,
    required this.volunteerData,
    required this.loginBookmark,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<VolunteerViewModel>(context, listen: false);
    final viewModelBookmark =
        Provider.of<ViewModelBookmark>(context, listen: false);
    final sp = Provider.of<SignInViewModel>(context, listen: false);
    final viewModelVolunteer =
        Provider.of<VolunteerViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailVolunteerPage(
              id: volunteerData.id,
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
              width: size.width / 3,
              height: size.width / 3,
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
                    volunteerData.photo,
                    height: 150,
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
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    viewModel.truncateText(
                                      volunteerData.title,
                                      20,
                                    ),
                                    style: TextStyle(
                                      color: AppTheme.primaryColor,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.height / 50,
                                    ),
                                  ),
                                  Consumer<SignInViewModel>(
                                    builder: (context, contactModel, child) {
                                      if (loginBookmark == true) {
                                        return SaveWidgetFixed(
                                          bookmarkId: volunteerData.bookmarkId,
                                          onPressed: () async {
                                            if (volunteerData.bookmarkId !=
                                                "") {
                                              await viewModelBookmark
                                                  .deleteBookmark(
                                                accessToken: sp
                                                    .accessTokenSharedPreference,
                                                refreshToken: sp
                                                    .refreshTokenSharedPreference,
                                                idBookmark:
                                                    volunteerData.bookmarkId,
                                              );
                                              await viewModelVolunteer
                                                  .fetchSearchVolunteer(
                                                accessToken: sp
                                                    .accessTokenSharedPreference,
                                                refreshToken: sp
                                                    .refreshTokenSharedPreference,
                                              );
                                            } else {
                                              await viewModelBookmark.postBookmark(
                                                  accessToken: sp
                                                      .accessTokenSharedPreference,
                                                  refreshToken: sp
                                                      .refreshTokenSharedPreference,
                                                  id: volunteerData.id,
                                                  postType: 'vacancy');
                                              await viewModelVolunteer
                                                  .fetchSearchVolunteer(
                                                accessToken: sp
                                                    .accessTokenSharedPreference,
                                                refreshToken: sp
                                                    .refreshTokenSharedPreference,
                                              );
                                            }
                                          },
                                        );
                                      } else {
                                        return SaveWidgetFixed(
                                          bookmarkId: "",
                                          onPressed: () async {
                                            customAlert(
                                              context: context,
                                              alertType: QuickAlertType.error,
                                              text: 'Anda belum melakukan login',
                                            );
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  viewModel.truncateText(
                                    volunteerData.description,
                                    30,
                                  ),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Helvetica',
                                    fontSize: size.height / 60,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: LinearProgressIndicator(
                        value: volunteerData.totalRegistrants /
                            volunteerData.numberOfVacancies,
                        color: AppTheme.primaryColor,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5.0),
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
                                volunteerData.province,
                                style: const TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8.0),
                          Row(
                            children: [
                              const Text(
                                'Slot',
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
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
                            viewModel.truncateText(
                              volunteerData.city,
                              15,
                            ),
                            style: TextStyle(
                              color: const Color(0xFF959CB4),
                              fontSize: size.height / 60,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            '${volunteerData.numberOfVacancies} Slot Tersisa',
                            style: TextStyle(
                              color: const Color(0xFF959CB4),
                              fontSize: size.height / 60,
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
