import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_historyapplyvolunteer.dart';
import 'package:flutter_raih_peduli/utils/state/finite_state.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HistoryApplyVolunteerCard extends StatefulWidget {
  const HistoryApplyVolunteerCard({super.key});

  @override
  State<HistoryApplyVolunteerCard> createState() =>
      _HistoryApplyVolunteerCardState();
}

class _HistoryApplyVolunteerCardState extends State<HistoryApplyVolunteerCard> {
  late HistoryApplyVolunteerViewModel historyApplyVolunteerViewModel;

  @override
  void initState() {
    super.initState();
    historyApplyVolunteerViewModel =
        Provider.of<HistoryApplyVolunteerViewModel>(context, listen: false);
    historyApplyVolunteerViewModel.getHistoryApplyVolunteer();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<HistoryApplyVolunteerViewModel>(
      builder: (context, provider, child) {
        final providerData = provider.historyApplyVolunteerModel!.data;
        if (provider.myState == MyState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: providerData.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.46,
                          height: size.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2022/12/05093645/Benarkah-Relawan-Kesehatan-Tak-Perlu-Lulusan-Sekolah-Kesehatan.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Flexible(
                          child: SizedBox(
                            height: size.width * 0.28,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'a',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff293066),
                                    fontSize: 12,
                                    fontFamily: 'Helvetica',
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Text(
                                  'b',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Helvetica',
                                    fontSize: 8,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              'Target',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                fontFamily: 'Helvetica',
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: size.width * 0.002),
                                              child: Icon(
                                                Icons.location_on,
                                                size: size.width * 0.028,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'c',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            fontFamily: 'Helvetica',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              'Hari',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                fontFamily: 'Helvetica',
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: size.width * 0.005),
                                              child: SvgPicture.asset(
                                                'assets/kalender.svg',
                                                width: size.width * 0.028,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Hari',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            fontFamily: 'Helvetica',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: size.width * 0.055,
                                  decoration: BoxDecoration(
                                    color: historyApplyVolunteerViewModel
                                        .containerColor,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: historyApplyVolunteerViewModel
                                          .borderColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      historyApplyVolunteerViewModel
                                          .statusText, // Use the updated status text here
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: historyApplyVolunteerViewModel
                                            .textColor,
                                        fontSize: 12,
                                        fontFamily: 'Helvetica',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
