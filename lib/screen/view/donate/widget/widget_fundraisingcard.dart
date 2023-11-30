import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_fundraising.dart';
import 'package:flutter_raih_peduli/model/volunteer_data.dart';
import 'package:flutter_raih_peduli/screen/view/donate/detaildonatescreen.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/donate/widget_savebookmark.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../theme/theme.dart';

class FundraisingCard extends StatelessWidget {
  final ModelFundraising? modelFundraising;
  final VolunteerData? volunteerData;

  const FundraisingCard({
    Key? key,
    required this.modelFundraising, required this.volunteerData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailDonateScreen(modelFundraising: modelFundraising, volunteerData: volunteerData),
          ),
        );
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: AppTheme.ornamentColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (modelFundraising == null)
              Container(
                height: 98,
                width: 102,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 0,
                    bottom: 0,
                    left: 0,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: SvgPicture.asset(
                      modelFundraising!.photo.toString(),
                      height: 98,
                      width: 102,
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
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: Image.network(
                           modelFundraising!.photo.toString(),
                          height: 98,
                          width: 102,
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
                                 modelFundraising!.title.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                // Bookmark widget
                                const SaveBookmark(),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Target
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/clock.svg',
                                      height: 18,
                                    ),
                                    const SizedBox(width: 3.0),
                                    const Text('Sisa Hari',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                                const SizedBox(width: 8.0),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/target.svg',
                                      height: 14,
                                    ),
                                    const SizedBox(width: 3.0),
                                    const Text('Target',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                                // Sisa Hari
                              ],
                            ),
                            const SizedBox(height: 4.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${modelFundraising.endDate - modelFundraising.startDate} Hari',
                                  style: const TextStyle(
                                    color: AppTheme.primaryColor,
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                Text(
                                  'Rp. ${modelFundraising!.target}',
                                  style: const TextStyle(
                                    color: AppTheme.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Rp ${modelFundraising!.progress.toString()}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                Container(
                                  width: 29.42,
                                  height: 12.10,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6.21, vertical: 1.55),
                                  decoration: ShapeDecoration(
                                    color: AppTheme.ornamentDarkColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(24.84),
                                    ),
                                  ),
                                  child: Text(
                                    '${(modelFundraising!.status / modelFundraising!.target * 100).toStringAsFixed(0)}%',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFF282F65),
                                      fontSize: 8,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(18)),
                              child: LinearProgressIndicator(
                                minHeight: 9,
                                value: modelFundraising!.status /
                                    modelFundraising!.target,
                                color: AppTheme.primaryColor,
                                backgroundColor: Colors.grey,
                              ),
                            )
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
