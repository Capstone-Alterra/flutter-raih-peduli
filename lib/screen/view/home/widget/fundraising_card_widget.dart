import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/donate_data.dart';
import 'package:flutter_raih_peduli/screen/view/donate/detaildonatescreen.dart';
import 'package:flutter_raih_peduli/theme/theme.dart';

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
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 125,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Image.network(
                    fundraisingData?.imageUrl ?? '',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fundraisingData?.title ?? '',
                    style: const TextStyle(
                      color: AppTheme.primaryColor,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    fundraisingData?.description ?? '',
                    maxLines: 1,
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
                              Image.asset(
                                'assets/icons/target.png',
                                height: 10,
                              ),
                              const Text(
                                'Target',
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            'Rp. ${fundraisingData?.target ?? 0}',
                            style: const TextStyle(
                              color: AppTheme.primaryColor,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailDonateScreen(
                                fundraisingData: fundraisingData),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        child: const Text(
                          'Lihat Detail',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Helvetica',
                              color: AppTheme.white),
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
    );
  }
}
