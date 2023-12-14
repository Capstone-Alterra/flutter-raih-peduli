import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
// import 'package:flutter_raih_peduli/model/volunteer_data.dart';
// import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/relawan_card_widget.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../model/model_bookmark.dart';

class RelawanListView extends StatelessWidget {
    final List<Vacancy> volunteerData;
  const RelawanListView({super.key, required this.volunteerData});




  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Relawan',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Helvetica',
                ),
              ),
            ],
          ),
        ),
        for (var data in volunteerData)
          Card(
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
                    // You can set a background color for the rounded rectangle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      left: 10.0, // Padding di sebelah kiri
                    ),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      child: Image.network(
                        data.photo,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Padding for spacing
                const SizedBox(width: 3.0),
                // Data
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
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
                                        data.title,
                                        style: const TextStyle(
                                          color: AppTheme.primaryColor,
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      // Bookmark widget
                                      const SaveWidget(),
                                    ],
                                  ),
                                  const SizedBox(
                                      height:
                                          10.0), // Jarak antara judul dan periode
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text("${data.applicationDeadline}"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 8.0),
                        //   child: LinearProgressIndicator(
                        //     value: data.progress / volunteerData.slot,
                        //     color: AppTheme.primaryColor,
                        //     backgroundColor: Colors.grey,
                        //   ),
                        // ),
                        const SizedBox(height: 8.0),
                        // Baris untuk ikon, tulisan target, dan sisa hari
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Target
                              Row(
                                children: [
                                  Text(data.city),
                                  const SizedBox(width: 3),
                                  SvgPicture.asset(
                                    'assets/lokasi.svg',
                                    height: 15,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8.0),
                              // Sisa Hari
                              Row(
                                children: [
                                  const Text('Slot'),
                                  const SizedBox(width: 3),
                                  SvgPicture.asset(
                                      'assets/orang.svg', // Ganti dengan path ke asset yang sesuai
                                      height: 15),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        // Baris untuk nilai atau value
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.city,
                                style: const TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                '3 Orang',
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
      ],
    );
  }
}
