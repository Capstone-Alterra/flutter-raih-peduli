import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_historydonation.dart';
import 'package:flutter_raih_peduli/utils/state/finite_state.dart';
import 'package:provider/provider.dart';

class HistoryDonationCard extends StatefulWidget {
  const HistoryDonationCard({super.key});

  @override
  State<HistoryDonationCard> createState() => _HistoryDonationCardState();
}

class _HistoryDonationCardState extends State<HistoryDonationCard> {
  late DonationHistoryViewModel donationHistoryViewModel;
  @override
  void initState() {
    super.initState();
    donationHistoryViewModel =
        Provider.of<DonationHistoryViewModel>(context, listen: false);
    donationHistoryViewModel.getDonationHistory();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<DonationHistoryViewModel>(
      builder: (context, provider, child) {
        final providerData = provider.historyDonationModel!.data;
        if (provider.myState == MyState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (providerData.isEmpty) {
            return const Text('');
          } else {
            return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
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
                            image: DecorationImage(
                              image: NetworkImage(providerData[index].fundraisePhoto),
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
                                  providerData[index]
                                      .fundraiseName,
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
                                  donationHistoryViewModel.formattedPrice(
                                      providerData[index]
                                          .amount
                                          .toString()),
                                  style: const TextStyle(
                                    color: Color(0xff293066),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Helvetica',
                                    fontSize: 13,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: size.width * 0.055,
                                  decoration: BoxDecoration(
                                      color: donationHistoryViewModel
                                          .containerColor,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: donationHistoryViewModel
                                            .borderColor,
                                        width: 1,
                                      )),
                                  child: Center(
                                    child: Text(
                                      donationHistoryViewModel.statusText,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            donationHistoryViewModel.textColor,
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
