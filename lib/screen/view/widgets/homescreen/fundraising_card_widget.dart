// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
// import 'package:flutter_raih_peduli/model/model_home.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
// import 'package:flutter_raih_peduli/model/fundraising_data.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../fundraises/detail_fundraise.dart';

class FundraisingCard extends StatelessWidget {
  // final Data fundraiseData;
  final int id;
  final String photo;
  final String title;
  final String description;
  final int target;

  const FundraisingCard({
    super.key,
    required this.photo,
    required this.title,
    required this.description,
    required this.target,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat("#,##0", "en_US");
    final viewModel = Provider.of<FundraisesViewModel>(context, listen: false);
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
                      // fundraiseData.photo,
                      photo,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      viewModel.truncateText(title, 20),
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold,
                        fontSize: sizecontent / 15,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      viewModel.truncateText(description, 30),
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
                          'assets/target.svg',
                          height: sizecontent / 18,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          'Target',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: sizecontent / 18,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Rp ${formatter.format(target)}",
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontFamily: 'Helvetica',
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
                        builder: (context) => DetailFundraisePage(
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
