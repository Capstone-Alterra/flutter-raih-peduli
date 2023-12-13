import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_historycreatevolunteer.dart';
import 'package:flutter_raih_peduli/utils/state/finite_state.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HistoryReqVolunteerCard extends StatefulWidget {
  const HistoryReqVolunteerCard({super.key});

  @override
  State<HistoryReqVolunteerCard> createState() => _CardReqVolunteerState();
}

class _CardReqVolunteerState extends State<HistoryReqVolunteerCard> {
  late HistoryCreateVolunteerViewModel historyCreateVolunteerViewModel;
  @override
  void initState() {
    super.initState();
    historyCreateVolunteerViewModel =
        Provider.of<HistoryCreateVolunteerViewModel>(context, listen: false);
    historyCreateVolunteerViewModel.getHistoryCreateVolunteer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<HistoryCreateVolunteerViewModel>(
        builder: (context, provider, child) {
      if (provider.myState == MyState.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        if (provider.historyCreateVolunteerModel == null ||
            provider.historyCreateVolunteerModel!.data.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: provider.historyCreateVolunteerModel!.data.length,
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
                                  .historyCreateVolunteerModel!
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
                                  provider.historyCreateVolunteerModel!
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
                                  historyCreateVolunteerViewModel.formatDate(
                                      provider.historyCreateVolunteerModel!
                                          .data[index].applicationDeadline),
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
                                            Text(
                                              provider
                                                  .historyCreateVolunteerModel!
                                                  .data[index]
                                                  .city,
                                              style: const TextStyle(
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
                                        Text(
                                          provider.historyCreateVolunteerModel!
                                              .data[index].province,
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
                                              'Slot Relawan',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                fontFamily: 'Helvetica',
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: size.width * 0.002),
                                              child: SvgPicture.asset(
                                                'assets/People.svg',
                                                width: size.width * 0.028,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${provider.historyCreateVolunteerModel!.data[index].numberOfVacancies} Orang',
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
                                    color: historyCreateVolunteerViewModel
                                        .containerColor,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: historyCreateVolunteerViewModel
                                          .borderColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      historyCreateVolunteerViewModel
                                          .statusText, // Use the updated status text here
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: historyCreateVolunteerViewModel
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
    });
  }
}
