import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/detail_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VolunteerCard extends StatelessWidget {
  final Data volunteerData;

  const VolunteerCard({super.key, 
    required this.volunteerData,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizecontent = size.width / 2;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rounded rectangle container for the image
          Container(
            width: sizecontent,
            height: sizecontent / 2.5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                 child: Image.network(
                    volunteerData.photo,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          // Data
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  volunteerData.title,
                  style: const TextStyle(
                    color: AppTheme.primaryColor,
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  volunteerData.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                            'assets/orang.svg', 
                            height: 10,
                          ),
                          const SizedBox(width: 5),
                            const Text(
                            'Slot', 
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                            ),
                            ),
                          ],
                        ),
                        Text(
                          '${volunteerData.numberOfVacancies} Orang',
                          style: const TextStyle(
                            fontFamily: 'Helvetica',
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: sizecontent / 4.6),
                    GestureDetector(
                      onTap: () {
                        // Aksi yang akan dijalankan saat tombol lihat detail ditekan
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailVolunteerPage(volunteerData: volunteerData, volunteerId: volunteerData.id,),),
                      );
                      },
                      child: Container(
                height: sizecontent / 8,
                width: 80,
                decoration: const BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      4.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Lihat Detail',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: sizecontent / 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
