import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/riwayat/detail_riwayat_relawan.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_historyapplyvolunteer.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<HistoryApplyVolunteerViewModel>(
      builder: (context, provide, child) {
        return historyApplyVolunteerViewModel.isLoading
            ? const SizedBox(
                height: 0,
              )
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: historyApplyVolunteerViewModel
                    .historyApplyVolunteerModel!.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> colorStatus =
                      historyApplyVolunteerViewModel.getColorStatus(
                          historyApplyVolunteerViewModel
                              .historyApplyVolunteerModel!.data[index].status);
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RiwayatDetailApplyVolunteer(
                              dataHistoryApplyVolunteer:
                                  historyApplyVolunteerViewModel
                                      .historyApplyVolunteerModel!.data[index]),
                        ),
                      );
                    },
                    child: Padding(
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
                                    image: NetworkImage(
                                        historyApplyVolunteerViewModel
                                            .historyApplyVolunteerModel!
                                            .data[index]
                                            .vacancyPhoto),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Flexible(
                                child: SizedBox(
                                  height: size.width * 0.28,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        historyApplyVolunteerViewModel
                                            .historyApplyVolunteerModel!
                                            .data[index]
                                            .vacancyName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff293066),
                                          fontSize: 12,
                                          fontFamily: 'Helvetica',
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Skill',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              fontFamily: 'Helvetica',
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          SizedBox(
                                            height: 20,
                                            width: 180,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  historyApplyVolunteerViewModel
                                                      .historyApplyVolunteerModel!
                                                      .data[index]
                                                      .skillsRequired
                                                      .take(2)
                                                      .length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int indexSkill) {
                                                if (historyApplyVolunteerViewModel
                                                    .historyApplyVolunteerModel!
                                                    .data[index]
                                                    .skillsRequired[indexSkill]
                                                    .isEmpty) {
                                                  return Container(
                                                    width: size.width * 0.16,
                                                    height: size.width * 0.05,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffFFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                        color: Colors.red,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: const Text(
                                                      'Skill Issue',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.red,
                                                        fontSize: 8,
                                                        fontFamily: 'Helvetica',
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return Row(
                                                    children: [
                                                      Container(
                                                        width:
                                                            size.width * 0.16,
                                                        height:
                                                            size.width * 0.05,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xffFFFFFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xff293066),
                                                            width: 2,
                                                          ),
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Text(
                                                          historyApplyVolunteerViewModel
                                                                  .historyApplyVolunteerModel!
                                                                  .data[index]
                                                                  .skillsRequired[
                                                              indexSkill],
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xff293066),
                                                            fontSize: 8,
                                                            fontFamily:
                                                                'Helvetica',
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 2),
                                                    ],
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: size.width * 0.055,
                                        decoration: BoxDecoration(
                                          color: colorStatus['containerColor'],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: colorStatus['borderColor'],
                                            width: 1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            colorStatus[
                                                'statusText'], // Use the updated status text here
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: colorStatus['textColor'],
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
                    ),
                  );
                },
              );
        //   }
        // }
      },
    );
  }
}
