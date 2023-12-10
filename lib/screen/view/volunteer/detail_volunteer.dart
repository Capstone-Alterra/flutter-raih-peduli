// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
// import 'package:flutter_raih_peduli/model/model_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/form_apply.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailVolunteerPage extends StatefulWidget {
  int id;

  DetailVolunteerPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailVolunteerPage> createState() => _DetailVolunteerPageState();
}

class _DetailVolunteerPageState extends State<DetailVolunteerPage> {
  late VolunteerViewModel viewModel;
  @override
  void initState() {
    viewModel = Provider.of<VolunteerViewModel>(context, listen: false);
    viewModel.fetchDetailVolunteer(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detail Relawan',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontFamily: 'Helvetica',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppTheme.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          SaveWidget(),
        ],
      ),
      body: Consumer<VolunteerViewModel>(
        builder: (context, contactModel, child) {
          return viewModel.isDetail
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            viewModel.modelDetailVolunteer!.data.photo,
                            height: 250.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          viewModel.modelDetailVolunteer!.data.title,
                          style: const TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoColumn(
                                'Lokasi',
                                viewModel.modelDetailVolunteer!.data.province,
                                Icons.location_on),
                            const Spacer(),
                            _buildInfoColumn(
                                'Slot',
                                '${viewModel.modelDetailVolunteer!.data.numberOfVacancies} Orang',
                                Icons.people),
                            const Spacer(),
                            _buildInfoColumn(
                              'Waktu Pelaksanaan',
                              "${DateFormat('dd MMM yyyy').format(DateTime.parse(viewModel.modelDetailVolunteer!.data.createdAt.toString()))} - ${DateFormat('dd MMM yyyy').format(
                                DateTime.parse(
                                  viewModel.modelDetailVolunteer!.data
                                      .applicationDeadline
                                      .toString(),
                                ),
                              )}",
                              Icons.calendar_today,
                            ),
                          ],
                        ),
                      ),
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
                          viewModel.modelDetailVolunteer!.data.description,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Skill Yang Diperlukan:',
                              style: TextStyle(
                                color: AppTheme.primaryColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Wrap(
                                children: [
                                  for (var skill in viewModel
                                      .modelDetailVolunteer!
                                      .data
                                      .skillsRequired)
                                    Container(
                                      margin: const EdgeInsets.all(4.0),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 8.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppTheme.white,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          width: 1.0,
                                          color: AppTheme.primaryColor,
                                        ),
                                      ),
                                      child: Text(
                                        skill,
                                        style: const TextStyle(
                                            color: AppTheme.primaryColor,
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ApplyFormVolunteer(
                                        volunteerId: widget.id,
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme
                                .primaryColor, // Warna fill sesuai AppTheme.primaryColor
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Tombol bulat dengan radius 20.0
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Ikuti Program',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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
    );
  }

  Widget _buildInfoColumn(String label, String value, IconData iconData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              iconData,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(width: 8.0),
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Text(value),
      ],
    );
  }
}
