// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/access_volunteer_screen.dart';
// import 'package:flutter_raih_peduli/model/model_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/form_apply.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';

import '../../view_model/view_model_signin.dart';
import '../widgets/login_signup/alert.dart';

class DetailVolunteerPage extends StatefulWidget {
  int id;

  DetailVolunteerPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailVolunteerPage> createState() => _DetailVolunteerPageState();
}

class _DetailVolunteerPageState extends State<DetailVolunteerPage> {
  late VolunteerViewModel viewModelVolunteer;
  late SignInViewModel sp;
  @override
  void initState() {
    viewModelVolunteer = Provider.of<VolunteerViewModel>(context, listen: false);
    sp = Provider.of<SignInViewModel>(context, listen: false);
    viewModelVolunteer.fetchDetailVolunteer(
      id: widget.id,
      accessToken: sp.accessTokenSharedPreference,
      refreshToken: sp.refreshTokenSharedPreference,
    );
    sp.setSudahLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModelBookmark =
    Provider.of<ViewModelBookmark>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detail Relawan',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontFamily: 'Helvetica',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppTheme.primaryColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AccessVolunteerScreen()
              ),
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions:  [
          Consumer<VolunteerViewModel>(
              builder: (context, contactModel, child) {
                return viewModelVolunteer.isDetail? SaveWidgetFixed(
                  bookmarkId: viewModelVolunteer.modelDetailVolunteer!.data.bookmarkId,
                  onPressed: () async {
                    if (viewModelVolunteer.modelDetailVolunteer!.data.bookmarkId != "") {
                      await viewModelBookmark.deleteBookmark(
                          accessToken: sp.accessTokenSharedPreference,
                          refreshToken: sp.refreshTokenSharedPreference,
                          idBookmark:
                          viewModelVolunteer.modelDetailVolunteer!.data.bookmarkId);
                      viewModelVolunteer.fetchDetailVolunteer(id: viewModelVolunteer.modelDetailVolunteer!.data.id, accessToken: sp.accessTokenSharedPreference, refreshToken: sp.refreshTokenSharedPreference);
                    } else if (viewModelVolunteer.modelDetailVolunteer!.data.bookmarkId ==
                        "") {
                      await viewModelBookmark.postBookmark(
                          accessToken: sp.accessTokenSharedPreference,
                          refreshToken: sp.refreshTokenSharedPreference,
                          id: viewModelVolunteer.modelDetailVolunteer!.data.id,
                          postType: 'vacancy');
                      viewModelVolunteer.fetchDetailVolunteer(id: viewModelVolunteer.modelDetailVolunteer!.data.id, accessToken: sp.accessTokenSharedPreference, refreshToken: sp.refreshTokenSharedPreference);
                    }
                  },
                ) : SizedBox(height: 1,
                width: 1);;
              }),
        ],
      ),
      body: Consumer<VolunteerViewModel>(
        builder: (context, contactModel, child) {
          return viewModelVolunteer.isDetail
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            viewModelVolunteer.modelDetailVolunteer!.data.photo,
                            height: 250.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          viewModelVolunteer.modelDetailVolunteer!.data.title,
                          style: const TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoColumn(
                                'Lokasi',
                                viewModelVolunteer.modelDetailVolunteer!.data.province,
                                Icons.location_on),
                            const Spacer(),
                            _buildInfoColumn(
                                'Slot',
                                '${viewModelVolunteer.modelDetailVolunteer!.data.numberOfVacancies} Orang',
                                Icons.people),
                            const Spacer(),
                            _buildInfoColumn(
                              'Waktu Pelaksanaan',
                              "${DateFormat('dd MMM yyyy').format(DateTime.parse(viewModelVolunteer.modelDetailVolunteer!.data.createdAt.toString()))} - ${DateFormat('dd MMM yyyy').format(
                                DateTime.parse(
                                  viewModelVolunteer.modelDetailVolunteer!.data
                                      .applicationDeadline
                                      .toString(),
                                ),
                              )}",
                              Icons.calendar_today,
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0, top: 16.0),
                        child: Text(
                          'Deskripsi',
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          viewModelVolunteer.modelDetailVolunteer!.data.description,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Skill Yang Diperlukan:',
                              style: TextStyle(
                                color: AppTheme.primaryColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Wrap(
                                children: [
                                  for (var skill in viewModelVolunteer
                                      .modelDetailVolunteer!
                                      .data
                                      .skillsRequired)
                                    Container(
                                      margin: const EdgeInsets.all(4.0),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 8.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppTheme.white,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          width: 1.0,
                                          color: AppTheme.primaryColor,
                                        ),
                                      ),
                                      child: Text(
                                        skill,
                                        style: const TextStyle(
                                            color: AppTheme.primaryColor,
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Consumer<VolunteerViewModel>(
                          builder: (context, model, child) {
                            if (viewModelVolunteer.modelDetailVolunteer!.data
                                    .applicationDeadline
                                    .difference(DateTime.now())
                                    .inDays >=
                                0) {
                              return ElevatedButton(
                                onPressed: () {
                                  if (sp.isSudahLogin == false) {
                                    customAlert(
                                      context: context,
                                      alertType: QuickAlertType.error,
                                      text: 'Anda belum melakukan login',
                                      afterDelay: () {
                                        Navigator.pop(context);
                                      },
                                    );
                                  } else {
                                    if (viewModelVolunteer.modelDetailVolunteer!.data
                                            .isRegistered ==
                                        true) {
                                      customAlert(
                                        context: context,
                                        alertType: QuickAlertType.error,
                                        text: 'Anda sudah pernah mendaftar',
                                        afterDelay: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ApplyFormVolunteer(
                                            volunteerId: widget.id,
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    'Ikuti Program',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.secondaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    'Ikuti Program',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),

                        // Consumer<SignInViewModel>(
                        //   builder: (context, model, child) {
                        //     if (sp.isSudahLogin == false) {
                        //       return
                        //     } else {
                        //       return
                        //     }
                        //   },
                        // ),

                        // ElevatedButton(
                        //   onPressed: () {
                        //     if (sp.isSudahLogin == false) {
                        //       customAlert(
                        //         context: context,
                        //         alertType: QuickAlertType.error,
                        //         text: 'Anda belum melakukan login',
                        //         afterDelay: () {
                        //           Navigator.pop(context);
                        //         },
                        //       );
                        //     } else {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => ApplyFormVolunteer(
                        //             volunteerId: widget.id,
                        //           ),
                        //         ),
                        //       );
                        //     }
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: AppTheme
                        //         .primaryColor, // Warna fill sesuai AppTheme.primaryColor
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(
                        //           20.0), // Tombol bulat dengan radius 20.0
                        //     ),
                        //   ),
                        //   child: const Padding(
                        //     padding: EdgeInsets.all(12.0),
                        //     child: Text(
                        //       'Ikuti Program',
                        //       style: TextStyle(
                        //         fontSize: 18.0,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value, IconData iconData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              iconData,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(width: 8.0),
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Text(value),
      ],
    );
  }
}
