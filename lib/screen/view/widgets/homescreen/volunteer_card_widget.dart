import 'package:flutter/material.dart';
// import 'package:flutter_raih_peduli/model/model_volunteer.dart';
// import 'package:flutter_raih_peduli/screen/view/volunteer/detail_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../volunteer/detail_volunteer.dart';

class VolunteerCard extends StatelessWidget {
  final String photo;
  final String title;
  final String description;
  final int numberOfVacancies;
  final int id;

  const VolunteerCard({
    super.key,
    required this.photo,
    required this.title,
    required this.description,
    required this.numberOfVacancies,
    required this.id,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: sizecontent,
                height: sizecontent / 2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5, right: 5),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: Image.network(
                      photo,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold,
                        fontSize: sizecontent / 15,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: sizecontent / 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                        const SizedBox(width: 3),
                        Text(
                          'Slot',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: sizecontent / 18,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '$numberOfVacancies Orang',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: sizecontent / 20,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailVolunteerPage(
                          id: id,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: sizecontent / 3,
                    height: sizecontent / 10,
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
                          fontSize: sizecontent / 23,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
