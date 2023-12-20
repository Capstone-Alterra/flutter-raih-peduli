import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/widgets/amount_button_widget.dart';
import 'package:flutter_raih_peduli/screen/view/signin_dan_signup/masuk_atau_daftar.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/history/card_riwayat_donasi.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/history/card_riwayat_relawan.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/history/card_riwayat_reqdonasi.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/history/card_riwayat_reqvolunteer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';
import '../../view_model/view_model_historyapplyvolunteer.dart';
import '../../view_model/view_model_historycreatedonasi.dart';
import '../../view_model/view_model_historycreatevolunteer.dart';
import '../../view_model/view_model_historydonation.dart';
import '../../view_model/view_model_signin.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  late SignInViewModel sp;
  late HistoryApplyVolunteerViewModel historyApplyVolunteerViewModel;
  late HistoryReqDonasiViewModel historyReqDonasiViewModel;
  late DonationHistoryViewModel donationHistoryViewModel;
  late HistoryCreateVolunteerViewModel historyCreateVolunteerViewModel;

  @override
  void initState() {
    sp = Provider.of<SignInViewModel>(context, listen: false);
    historyApplyVolunteerViewModel =
        Provider.of<HistoryApplyVolunteerViewModel>(context, listen: false);
    historyReqDonasiViewModel =
        Provider.of<HistoryReqDonasiViewModel>(context, listen: false);
    donationHistoryViewModel =
        Provider.of<DonationHistoryViewModel>(context, listen: false);
    historyCreateVolunteerViewModel =
        Provider.of<HistoryCreateVolunteerViewModel>(context, listen: false);
    sp.setSudahLogin();
    donationHistoryViewModel.getDonationHistory(
      accessToken: sp.accessTokenSharedPreference,
      refreshToken: sp.refreshTokenSharedPreference,
    );
    historyApplyVolunteerViewModel.getHistoryApplyVolunteer(
      accessToken: sp.accessTokenSharedPreference,
      refreshToken: sp.refreshTokenSharedPreference,
    );
    historyReqDonasiViewModel.getCreateFundraiseHistory(
      accessToken: sp.accessTokenSharedPreference,
      refreshToken: sp.refreshTokenSharedPreference,
    );
    historyCreateVolunteerViewModel.getHistoryCreateVolunteer(
      accessToken: sp.accessTokenSharedPreference,
      refreshToken: sp.refreshTokenSharedPreference,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Riwayat',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontFamily: 'Helvetica',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<SignInViewModel>(builder: (context, contactModel, child) {
        bool coba = false;
        // bool allHistoryEmpty = donationHistoryViewModel.historyDonationModel ==
        //         null ||
        //     donationHistoryViewModel.historyDonationModel!.data.isEmpty ||
        //     historyApplyVolunteerViewModel.historyApplyVolunteerModel == null ||
        //     historyApplyVolunteerViewModel
        //         .historyApplyVolunteerModel!.data.isEmpty ||
        //     historyReqDonasiViewModel.historyCreateFundraiseModel == null ||
        //     historyReqDonasiViewModel
        //         .historyCreateFundraiseModel!.data.isEmpty ||
        //     historyCreateVolunteerViewModel.historyCreateVolunteerModel ==
        //         null ||
        //     historyCreateVolunteerViewModel
        //         .historyCreateVolunteerModel!.data.isEmpty;
        if (donationHistoryViewModel.historyDonationModel == null ||
            donationHistoryViewModel.historyDonationModel!.data.isEmpty ||
            historyApplyVolunteerViewModel.historyApplyVolunteerModel == null ||
            historyApplyVolunteerViewModel
                .historyApplyVolunteerModel!.data.isEmpty ||
            historyReqDonasiViewModel.historyCreateFundraiseModel == null ||
            historyReqDonasiViewModel
                .historyCreateFundraiseModel!.data.isEmpty ||
            historyCreateVolunteerViewModel.historyCreateVolunteerModel ==
                null ||
            historyCreateVolunteerViewModel
                .historyCreateVolunteerModel!.data.isEmpty) {
          coba = false;
        } else {
          coba = true;
        }
        return sp.isSudahLogin
            ? SizedBox(
                height: MediaQuery.of(context)
                    .size
                    .height, // Adjust this height as needed
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context)
                              .size
                              .height, // Set a minimum height
                        ),
                        child: coba
                            ? const Text("text")
                            : Column(
                                children: [
                                  Consumer<DonationHistoryViewModel>(
                                    builder: (context, contactModel, child) {
                                      return const HistoryDonationCard();
                                    },
                                  ),
                                  Consumer<HistoryApplyVolunteerViewModel>(
                                    builder: (context, contactModel, child) {
                                      return const HistoryApplyVolunteerCard();
                                    },
                                  ),
                                  Consumer<HistoryReqDonasiViewModel>(
                                    builder: (context, contactModel, child) {
                                      return const HistoryRequestDonationCard();
                                    },
                                  ),
                                  Consumer<HistoryCreateVolunteerViewModel>(
                                    builder: (context, contactModel, child) {
                                      return const HistoryReqVolunteerCard();
                                    },
                                  ),
                                ],
                              )

                        //  coba
                        //     ? Center(
                        //         child: Text(
                        //           'Tidak ada Riwayaaaaaaat',
                        //           style: TextStyle(
                        //             color:
                        //                 AppTheme.tertiaryColor.withOpacity(0.9),
                        //             fontFamily: 'Helvetica',
                        //             fontSize: 16,
                        //             fontWeight: FontWeight.w500,
                        //           ),
                        //           textAlign: TextAlign.center,
                        //         ),
                        //       )
                        //     : Column(
                        //         children: [
                        //           // if (donationHistoryViewModel
                        //           //             .historyDonationModel !=
                        //           //         null &&
                        //           //     donationHistoryViewModel
                        //           //         .historyDonationModel!.data.isNotEmpty)
                        //           HistoryDonationCard(),
                        //           // if (historyApplyVolunteerViewModel
                        //           //             .historyApplyVolunteerModel !=
                        //           //         null &&
                        //           //     historyApplyVolunteerViewModel
                        //           //         .historyApplyVolunteerModel!
                        //           //         .data
                        //           //         .isNotEmpty)
                        //           HistoryApplyVolunteerCard(),
                        //           // if (historyReqDonasiViewModel
                        //           //             .historyCreateFundraiseModel !=
                        //           //         null &&
                        //           //     historyReqDonasiViewModel
                        //           //         .historyCreateFundraiseModel!
                        //           //         .data
                        //           //         .isNotEmpty)
                        //           HistoryRequestDonationCard(),
                        //           // if (historyCreateVolunteerViewModel
                        //           //             .historyCreateVolunteerModel !=
                        //           //         null &&
                        //           //     historyCreateVolunteerViewModel
                        //           //         .historyCreateVolunteerModel!
                        //           //         .data
                        //           //         .isNotEmpty)
                        //           HistoryReqVolunteerCard(),
                        //           if (donationHistoryViewModel.historyDonationModel == null ||
                        //               donationHistoryViewModel
                        //                   .historyDonationModel!.data.isEmpty ||
                        //               historyApplyVolunteerViewModel.historyApplyVolunteerModel ==
                        //                   null ||
                        //               historyApplyVolunteerViewModel
                        //                   .historyApplyVolunteerModel!.data.isEmpty ||
                        //               historyReqDonasiViewModel
                        //                       .historyCreateFundraiseModel ==
                        //                   null ||
                        //               historyReqDonasiViewModel
                        //                   .historyCreateFundraiseModel!
                        //                   .data
                        //                   .isEmpty ||
                        //               historyCreateVolunteerViewModel
                        //                       .historyCreateVolunteerModel ==
                        //                   null ||
                        //               historyCreateVolunteerViewModel
                        //                   .historyCreateVolunteerModel!
                        //                   .data
                        //                   .isEmpty)
                        //             Padding(
                        //               padding: const EdgeInsets.all(20.0),
                        //               child: Center(
                        //                 child: Text(
                        //                   'Tidak ada Riwayat',
                        //                   style: TextStyle(
                        //                     color: AppTheme.tertiaryColor
                        //                         .withOpacity(0.9),
                        //                     fontFamily: 'Helvetica',
                        //                     fontSize: 16,
                        //                     fontWeight: FontWeight.w500,
                        //                   ),
                        //                   textAlign: TextAlign.center,
                        //                 ),
                        //               ),
                        //             )
                        //         ],
                        //       ),
                        ),
                  ),
                ),
              )
            : Center(
                child: Column(
                  children: [
                    SizedBox(height: size.height / 12),
                    SvgPicture.asset(
                      "assets/transaksi_guest.svg",
                    ),
                    const SizedBox(height: 20),
                    customAmountButton(
                      text: 'Masuk / Daftar',
                      bgColor: const Color(0xFF293066),
                      width: size.width / 1.5,
                      height: size.height / 19,
                      textColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginAtauDaftar(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
