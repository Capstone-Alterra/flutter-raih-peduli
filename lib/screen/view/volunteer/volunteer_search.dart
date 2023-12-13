import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/detail_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../model/model_volunteer.dart';

// import '../../../../model/model_volunteer_pagination.dart';

class RelawanCardSearch extends StatelessWidget {
  final Datum volunteerData;

  const RelawanCardSearch({
    super.key,
    required this.volunteerData,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<VolunteerViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailVolunteerPage(
              id: volunteerData.id,
            ),
          ),
        );
      },
      child: Card(
        color: AppTheme.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width / 3,
              height: size.width / 3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  left: 10.0,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Image.network(
                    volunteerData.photo,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    viewModel.truncateText(
                                      volunteerData.title,
                                      20,
                                    ),
                                    style: TextStyle(
                                      color: AppTheme.primaryColor,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.height / 50,
                                    ),
                                  ),
                                  const SaveWidget(),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  viewModel.truncateText(
                                    volunteerData.description,
                                    30,
                                  ),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Helvetica',
                                    fontSize: size.height / 60,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: LinearProgressIndicator(
                        value: volunteerData.totalRegistrants /
                            volunteerData.numberOfVacancies,
                        color: AppTheme.primaryColor,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/lokasi.svg',
                              ),
                              Text(
                                volunteerData.province,
                                style: const TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8.0),
                          Row(
                            children: [
                              const Text(
                                'Slot',
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/orang.svg',
                                height: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            volunteerData.city,
                            style: TextStyle(
                              color: const Color(0xFF959CB4),
                              fontSize: size.height / 60,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            '${volunteerData.numberOfVacancies} Slot Tersisa',
                            style: TextStyle(
                              color: const Color(0xFF959CB4),
                              fontSize: size.height / 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
