import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../model/model_donate.dart';
import '../../../../theme/theme.dart';

class FundraisingCard extends StatelessWidget {
  final FundraisingData? fundraisingData;

  const FundraisingCard({
    Key? key,
    required this.fundraisingData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: AppTheme.ornamentColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (fundraisingData == null)
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
                  child: SvgPicture.asset(
                    fundraisingData!.imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      child: SvgPicture.asset(
                        fundraisingData!.imageUrl,
                        height: 150,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                fundraisingData!.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              // Bookmark widget
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Text(fundraisingData!.time),
                          const SizedBox(height: 8.0),
                          LinearProgressIndicator(
                            value: fundraisingData!.progress /
                                fundraisingData!.target,
                            color: AppTheme.primaryColor,
                            backgroundColor: Colors.grey,
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Target
                              Row(
                                children: [
                                  const Text('Target'),
                                  const SizedBox(width: 3.0),
                                  SvgPicture.asset(
                                    'assets/icons/target.svg',
                                    height: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8.0),
                              // Sisa Hari
                              Row(
                                children: [
                                  const Text('Sisa Hari'),
                                  const SizedBox(width: 3.0),
                                  SvgPicture.asset(
                                    'assets/icons/sisahari.svg',
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          // Baris untuk nilai atau value
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rp. ${fundraisingData!.target}',
                                style: const TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                '${fundraisingData!.remainingDays} Hari',
                                style: const TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
    );
  }
}
