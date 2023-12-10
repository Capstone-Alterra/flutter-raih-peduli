import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/fundraises/fundraise_screen.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/fundraising_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/news_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/viewall_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/volunteer_card_widget.dart';
// import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_home.dart';
// import 'package:flutter_raih_peduli/screen/view_model/view_model_news.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:provider/provider.dart';

// import '../../view_model/view_model_volunteer.dart';
import '../news/news_page.dart';
import '../volunteer/access_volunteer_screen.dart';

class HomeListViewBuilder extends StatefulWidget {
  const HomeListViewBuilder({super.key});

  @override
  State<HomeListViewBuilder> createState() => _HomeListViewBuilderState();
}

class _HomeListViewBuilderState extends State<HomeListViewBuilder> {
  late HomeViewModel viewModel;
  late SignInViewModel sp;
  @override
  void initState() {
    viewModel = Provider.of<HomeViewModel>(context, listen: false);
    sp = Provider.of<SignInViewModel>(context, listen: false);
    viewModel.fetchHome(
      accessToken: sp.accessTokenSharedPreference,
      refreshToken: sp.refreshTokenSharedPreference,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<HomeViewModel>(
      builder: (context, viewMode, child) {
        return viewModel.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Donasi Untuk Kebaikan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Helvetica',
                              ),
                            ),
                            ViewallWidget(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const FundraiseScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.width / 1.975,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var fundraise
                            in viewModel.modelHome!.data.fundraise)
                          SizedBox(
                            width: size.width / 1.975,
                            child: FundraisingCard(
                              title: fundraise.title,
                              photo: fundraise.photo,
                              description: fundraise.description,
                              target: fundraise.target!,
                              id: fundraise.id,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Jadilah Relawan Sosial',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Helvetica',
                              ),
                            ),
                            ViewallWidget(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AccessVolunteerScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2.5),
                  SizedBox(
                    height: size.width / 1.975,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var volunteer
                            in viewModel.modelHome!.data.volunteer)
                          SizedBox(
                            width: size.width / 1.975,
                            child: VolunteerCard(
                              photo: volunteer.photo,
                              title: volunteer.title,
                              description: volunteer.description,
                              numberOfVacancies: volunteer.numberOfVacancies!,
                              id: volunteer.id,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Temukan Informasi Terkini',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Helvetica',
                              ),
                            ),
                            ViewallWidget(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NewsPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2.5),
                  SizedBox(
                    height: size.width / 1.975,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var news in viewModel.modelHome!.data.news)
                          SizedBox(
                            width: size.width / 1.975,
                            child: NewsCard(
                              photo: news.photo,
                              title: news.title,
                              description: news.description,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
      },
    );
  }
}
