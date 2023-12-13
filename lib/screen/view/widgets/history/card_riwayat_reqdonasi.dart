import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_createfundraisehistory.dart';
import 'package:flutter_raih_peduli/utils/state/finite_state.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HistoryRequestDonationCard extends StatefulWidget {
  const HistoryRequestDonationCard({super.key});

  @override
  State<HistoryRequestDonationCard> createState() =>
      _HistoryRequestDonationCardState();
}

class _HistoryRequestDonationCardState
    extends State<HistoryRequestDonationCard> {
  late CreateFundraiseHistoryViewModel createFundraiseHistoryViewModel;
  @override
  void initState() {
    super.initState();
    createFundraiseHistoryViewModel =
        Provider.of<CreateFundraiseHistoryViewModel>(context, listen: false);
    createFundraiseHistoryViewModel.getCreateFundraiseHistory();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<CreateFundraiseHistoryViewModel>(
      builder: (context, provider, child) {
        if (provider.myState == MyState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (provider.historyCreateFundraiseModel == null ||
              provider.historyCreateFundraiseModel!.data.isEmpty) {
            return const SizedBox.shrink();
          } else {
            return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: provider.historyCreateFundraiseModel!.data.length,
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
                            image: DecorationImage(
                              image: NetworkImage(provider
                                    .historyCreateFundraiseModel!
                                    .data[index]
                                  .photo),
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
                                  provider.historyCreateFundraiseModel!
                                        .data[index].title,
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
                                  createFundraiseHistoryViewModel.formatDate(
                                      provider.historyCreateFundraiseModel!
                                            .data[index].endDate),
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
                                          createFundraiseHistoryViewModel
                                              .formattedPrice(
                                                    provider
                                                    .historyCreateFundraiseModel!
                                                    .data[index]
                                                  .target
                                                  .toString()),
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
                                          '${createFundraiseHistoryViewModel.remainingDays.toString()} Hari',
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
                                    color: createFundraiseHistoryViewModel
                                        .containerColor,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: createFundraiseHistoryViewModel
                                          .borderColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      createFundraiseHistoryViewModel
                                          .statusText, // Use the updated status text here
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: createFundraiseHistoryViewModel
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
        }
      },
    );
  }
}
