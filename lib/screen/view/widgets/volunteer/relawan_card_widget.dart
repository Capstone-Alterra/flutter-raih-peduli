import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/detail_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RelawanCard extends StatelessWidget {
  final Data volunteerData;

  const RelawanCard({
    required this.volunteerData,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<VolunteerViewModel>(context, listen: false);

    return InkWell(
      onTap: () {
        // Navigasi ke halaman detail volunteer dengan mengirimkan data volunteer
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailVolunteerPage(volunteerData: volunteerData),
          ),
        );
      },
      child: Card(
        color: AppTheme.white,
        elevation: 3,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rounded rectangle container for the image
            Container(
              width: 140,
              height: 150,
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
            const SizedBox(width: 3.0),
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
                                    volunteerData.title,
                                    style: const TextStyle(
                                      color: AppTheme.primaryColor,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SaveWidget(),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(viewModel.truncateText(
                                    volunteerData.description, 100)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: LinearProgressIndicator(
                        value: volunteerData.totalRegistrar /
                            volunteerData.numberOfVacancies,
                        color: AppTheme.primaryColor,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(volunteerData.province),
                              SvgPicture.asset(
                                'assets/lokasi.svg',
                                height: 20,
                              ),
                            ],
                          ),
                          const SizedBox(width: 8.0),
                          Row(
                            children: [
                              const Text('Slot'),
                              SvgPicture.asset(
                                'assets/orang.svg',
                                height: 20,
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
                            style: const TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            '${volunteerData.numberOfVacancies} Slot Tersisa',
                            style: const TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
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
