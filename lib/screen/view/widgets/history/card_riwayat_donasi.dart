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
        if (provider.myState == MyState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (provider.historyDonationModel!.data.isEmpty) {
          return const Center(
            child: Text('Tidak ada data'),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: provider.historyDonationModel!.data.length,
            itemBuilder: (context, index){
              return Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.03,
                    right: size.width * 0.03,
                  ),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.5,
                          height: size.width * 0.28,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(size.width * 0.03),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              child: Image.network(
                                'https://i0.wp.com/ketto.blog/wp-content/uploads/2022/07/How-to-raise-funds-and-donations-during-charity-events-1.png?fit=1920%2C1080&ssl=1',
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.37,
                          height: size.width * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Donasi Untuk Anak - Anak Indonesia',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff293066),
                                  fontSize: 12,
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                              Text(
                                provider.historyDonationModel!.data[index].amount.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff293066),
                                  fontSize: 10,
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: size.width * 0.055,
                                decoration: BoxDecoration(
                                    color: const Color(0xffEFFAF4),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: const Color(0xff166648),
                                      width: 1,
                                    )),
                                child: const Center(
                                  child: Text(
                                    'Berhasil',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff166648),
                                      fontSize: 12,
                                      fontFamily: 'Helvetica',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
            }
          );
        }
      },
    );
  }
}
