import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/form_apply.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/save_widget.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:intl/intl.dart';

class DetailVolunteerPage extends StatelessWidget {
  final Data volunteerData;

  DetailVolunteerPage({required this.volunteerData});

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner Image
            Container(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(12.0), // Sesuaikan dengan kebutuhan
                child: Image.network(
                  volunteerData.photo,
                  height: 250.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Volunteer Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                volunteerData.title,
                style: const TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Row: Lokasi, Slot, dan Period
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoColumn(
                      'Lokasi', volunteerData.province, Icons.location_on),
                  const Spacer(),
                  _buildInfoColumn('Slot',
                      '${volunteerData.numberOfVacancies} Orang', Icons.people),
                  const Spacer(),
                  _buildInfoColumn(
                    'Waktu Pelaksanaan',
                    DateFormat('yyyy-MM-dd HH:mm:ss')
                        .format(volunteerData.applicationDeadline),
                    Icons.calendar_today,
                  ),
                ],
              ),
            ),

            // Judul Deskripsi
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

            // Deskripsi
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                volunteerData.description,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),

            // List Syarat
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Syarat & Ketentuan:',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Menampilkan numbering pada list syarat
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: volunteerData.description.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                            '${index + 1}. ${volunteerData.description[index]}'),
                      );
                    },
                  ),
                ],
              ),
            ),

            // List Skill
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
                  // Menampilkan list skill dalam container
                  Container(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Wrap(
                      children: [
                        for (var skill in volunteerData.skillsRequred)
                          Container(
                            margin: const EdgeInsets.all(4.0),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.white,
                              borderRadius: BorderRadius.circular(20.0),
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
            // Tombol Ikuti Program
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ApplyFormVolunteer()),
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
