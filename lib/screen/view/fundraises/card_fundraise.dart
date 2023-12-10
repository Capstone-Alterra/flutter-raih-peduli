// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'detail_fundraise.dart';

class CardFundraise extends StatelessWidget {
  final Datum fundraise;
  const CardFundraise({super.key, required this.fundraise});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FundraisesViewModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailFundraisePage(
              id: fundraise.id,
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
                    fundraise.photo,
                    // height: 150,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          viewModel.truncateText(fundraise.title, 15),
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
                    // const SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/jam.svg',
                                  ),
                                  Text(
                                    "Sisa hari",
                                    style: TextStyle(
                                      color: AppTheme.primaryColor,
                                      fontFamily: 'Helvetica',
                                      fontSize: size.height / 60,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "12 Hari",
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontFamily: 'Helvetica',
                                  fontSize: size.height / 70,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/target_panah.svg',
                                  ),
                                  Text(
                                    "Target",
                                    style: TextStyle(
                                      color: const Color(0xFF959CB4),
                                      fontFamily: 'Helvetica',
                                      fontSize: size.height / 60,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Rp 5.000.000",
                                style: TextStyle(
                                  color: const Color(0xFF959CB4),
                                  fontFamily: 'Helvetica',
                                  fontSize: size.height / 70,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Divider(thickness: 1.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rp ${fundraise.fundAcquired}",
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontFamily: 'Helvetica',
                              fontSize: size.height / 70,
                            ),
                          ),
                          Container(
                            height: 15,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD1DAEC),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  16.0,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "0%",
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontFamily: 'Helvetica',
                                  fontSize: size.height / 80,
                                ),
                              ),
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
