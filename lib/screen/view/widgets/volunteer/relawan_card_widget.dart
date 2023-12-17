import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_volunteer_pagination.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/detail_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

// import '../../../../model/model_volunteer_pagination.dart';

class RelawanCard extends StatelessWidget {
  final Datum volunteerData;

  const RelawanCard({
    super.key,
    required this.volunteerData,
  });

  @override
  Widget build(BuildContext context) {
    final viewModelVolunteer =
        Provider.of<VolunteerViewModel>(context, listen: false);
    final viewModelBookmark =
        Provider.of<ViewModelBookmark>(context, listen: false);
    final sp = Provider.of<SignInViewModel>(context, listen: false);
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
      child:
          Consumer<VolunteerViewModel>(builder: (context, contactModel, child) {
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
                                      viewModelVolunteer.truncateText(
                                        volunteerData.title,
                                        18,
                                      ),
                                      style: TextStyle(
                                        color: AppTheme.primaryColor,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SaveWidgetFixed(
                                      bookmarkId: volunteerData.bookmarkId,
                                      onPressed: () async {
                                        if (volunteerData.bookmarkId != "") {
                                          await viewModelBookmark.deleteBookmark(
                                              accessToken: sp
                                                  .accessTokenSharedPreference,
                                              refreshToken: sp
                                                  .refreshTokenSharedPreference,
                                              idBookmark:
                                                  volunteerData.bookmarkId);
                                          viewModelVolunteer.fetchVolunteerPagination(
                                              accessToken: sp
                                                  .accessTokenSharedPreference,
                                              refreshToken: sp
                                                  .refreshTokenSharedPreference);
                                        } else if (volunteerData.bookmarkId ==
                                            "") {
                                          await viewModelBookmark.postBookmark(
                                              accessToken: sp
                                                  .accessTokenSharedPreference,
                                              refreshToken: sp
                                                  .refreshTokenSharedPreference,
                                              id: volunteerData.id,
                                              postType: 'vacancy');
                                          viewModelVolunteer.fetchVolunteerPagination(
                                              accessToken: sp
                                                  .accessTokenSharedPreference,
                                              refreshToken: sp
                                                  .refreshTokenSharedPreference);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    viewModelVolunteer.truncateText(
                                      volunteerData.description,
                                      25,
                                    ),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Helvetica',
                                      fontSize: 14,
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
                                  viewModelVolunteer.truncateText(
                                      volunteerData.province, 13),
                                  style: const TextStyle(
                                    color: AppTheme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8.0),
                            Row(
                              children: [
                                const Text(
                                  'Slot Tersisa',
                                  style: TextStyle(
                                    color: AppTheme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
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
                              viewModelVolunteer.truncateText(
                                volunteerData.city,
                                25,
                              ),
                              style: const TextStyle(
                                color: Color(0xFF959CB4),
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              '${volunteerData.numberOfVacancies}',
                              style: const TextStyle(
                                color: Color(0xFF959CB4),
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
        );
      }),
    );
  }
}
