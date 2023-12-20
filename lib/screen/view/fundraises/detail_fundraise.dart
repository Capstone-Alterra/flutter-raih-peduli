import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/fundraise_screen.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/transaction_amount_screen.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/login_signup/alert.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';

class DetailFundraisePage extends StatefulWidget {
  final int id;

  const DetailFundraisePage({
    super.key,
    required this.id,
  });

  @override
  State<DetailFundraisePage> createState() => _DetailFundraisePageState();
}

class _DetailFundraisePageState extends State<DetailFundraisePage> {
  late FundraisesViewModel viewModelFundraise;
  late SignInViewModel sp;

  @override
  void initState() {
    viewModelFundraise =
        Provider.of<FundraisesViewModel>(context, listen: false);
    sp = Provider.of<SignInViewModel>(context, listen: false);
    viewModelFundraise.fetchDetailfundraises(
        id: widget.id,
        accessToken: sp.accessTokenSharedPreference,
        refreshToken: sp.refreshTokenSharedPreference);

    sp.setSudahLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModelBookmark =
        Provider.of<ViewModelBookmark>(context, listen: false);
    var formatter = NumberFormat("#,##0", "en_US");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detail Penggalangan Dana',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontFamily: 'Helvetica',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppTheme.primaryColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FundraiseScreen()),
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Consumer<FundraisesViewModel>(
            builder: (context, contactModel, child) {
              return viewModelFundraise.isDetail
                  ? Consumer<SignInViewModel>(
                      builder: (context, contactModel, child) {
                        if (sp.isSudahLogin == true) {
                          return SaveWidgetFixed(
                            bookmarkId: viewModelFundraise
                                .modelDetailFundraises!.data.bookmarkId,
                            onPressed: () async {
                              if (viewModelFundraise
                                      .modelDetailFundraises!.data.bookmarkId !=
                                  "") {
                                await viewModelBookmark.deleteBookmark(
                                  accessToken: sp.accessTokenSharedPreference,
                                  refreshToken: sp.refreshTokenSharedPreference,
                                  idBookmark: viewModelFundraise
                                      .modelDetailFundraises!.data.bookmarkId,
                                );
                                viewModelFundraise.fetchDetailfundraises(
                                  id: viewModelFundraise
                                      .modelDetailFundraises!.data.id,
                                  accessToken: sp.accessTokenSharedPreference,
                                  refreshToken: sp.refreshTokenSharedPreference,
                                );
                              } else {
                                await viewModelBookmark.postBookmark(
                                  accessToken: sp.accessTokenSharedPreference,
                                  refreshToken: sp.refreshTokenSharedPreference,
                                  id: viewModelFundraise
                                      .modelDetailFundraises!.data.id,
                                  postType: 'fundraise',
                                );
                                viewModelFundraise.fetchDetailfundraises(
                                  id: viewModelFundraise
                                      .modelDetailFundraises!.data.id,
                                  accessToken: sp.accessTokenSharedPreference,
                                  refreshToken: sp.refreshTokenSharedPreference,
                                );
                              }
                            },
                          );
                        } else {
                          return SaveWidgetFixed(
                            bookmarkId: "",
                            onPressed: () {
                              customAlert(
                                context: context,
                                alertType: QuickAlertType.error,
                                text: 'Anda belum melakukan login',
                              );
                            },
                          );
                        }
                      },
                    )
                  : const SizedBox(
                      height: 0,
                    );
            },
          ),
        ],
      ),
      body: Consumer<FundraisesViewModel>(
        builder: (context, contactModel, child) {
          return viewModelFundraise.isDetail
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            viewModelFundraise
                                .modelDetailFundraises!.data.photo,
                            height: 250.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          viewModelFundraise.modelDetailFundraises!.data.title,
                          style: const TextStyle(
                            color: AppTheme.tertiaryColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Text(
                          "${DateFormat('dd MMMM').format(DateTime.parse(viewModelFundraise.modelDetailFundraises!.data.startDate.toString()))} - ${DateFormat('dd MMMM yyy').format(DateTime.parse(viewModelFundraise.modelDetailFundraises!.data.endDate.toString()))}",
                          style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: size.height / 60),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 6, right: 16.0),
                        child: LinearProgressIndicator(
                          color: AppTheme.tertiaryColor,
                          value: (viewModelFundraise.modelDetailFundraises!.data
                                      .fundAcquired /
                                  viewModelFundraise
                                      .modelDetailFundraises!.data.target)
                              .toDouble(),
                          minHeight: 10,
                          borderRadius: const BorderRadius.all(
                              Radius.circular(10)), // Set the
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Target",
                                      style: TextStyle(
                                        color: AppTheme.primaryColor,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.height / 60,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Rp. ${formatter.format(viewModelFundraise.modelDetailFundraises!.data.target)}",
                                  style: TextStyle(
                                    color: AppTheme.tertiaryColor,
                                    fontFamily: 'Helvetica',
                                    fontSize: size.height / 50,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
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
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  viewModelFundraise.modelDetailFundraises!.data
                                              .endDate
                                              .difference(DateTime.now())
                                              .inDays >=
                                          0
                                      ? '${viewModelFundraise.modelDetailFundraises!.data.endDate.difference(DateTime.now()).inDays} Hari'
                                      : "Waktu Donasi Habis",
                                  style: TextStyle(
                                    color: AppTheme.tertiaryColor,
                                    fontFamily: 'Helvetica',
                                    fontSize: size.height / 50,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.only(left: 16.0, top: 16.0),
                      //   child: Text(
                      //     'Penggalang Dana',
                      //     style: TextStyle(
                      //       color: AppTheme.primaryColor,
                      //       fontSize: 18.0,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      // const Padding(
                      //     padding: EdgeInsets.only(left: 16.0, top: 16.0),
                      //     child: Row()),
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
                          viewModelFundraise
                              .modelDetailFundraises!.data.description,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      bottomNavigationBar: Consumer<FundraisesViewModel>(
        builder: (context, contactModel, child) {
          return viewModelFundraise.isDetail
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Consumer<FundraisesViewModel>(
                      builder: (context, contactModel, child) {
                    if (viewModelFundraise.modelDetailFundraises!.data.endDate
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TransactionAmountScreen(
                                  id: widget.id,
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Donasi Sekarang',
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
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Donasi Sekarang',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }
                  }),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
