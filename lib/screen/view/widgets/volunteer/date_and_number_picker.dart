import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/text_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer_form.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DateAndTotalVacancies extends StatefulWidget {
  const DateAndTotalVacancies({super.key});

  @override
  State<DateAndTotalVacancies> createState() => DateAndTotalVacanciesState();
}

class DateAndTotalVacanciesState extends State<DateAndTotalVacancies> {
  late VolunteerFormViewModel volunteerFormViewModel;
  @override
  void initState() {
    super.initState();
    volunteerFormViewModel =
        Provider.of<VolunteerFormViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textForVolunteer('Total Relawan'),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff8CA2CE).withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xff8CA2CE),
                ),
              ),
              height: size.height * 0.05,
              width: size.width * 0.24,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Ex. 50',
                  hintStyle: TextStyle(
                    color: Color(0xffB0B0B0),
                    fontFamily: 'Helvetica',
                    fontSize: 12,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textForVolunteer('Tanggal Selesai'),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                volunteerFormViewModel.setDate1(context);
              },
              child: Container(
                padding: EdgeInsets.only(
                  left: size.width * 0.02,
                  right: size.width * 0.02,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff8CA2CE).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xff8CA2CE),
                  ),
                ),
                height: size.height * 0.05,
                width: size.width * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('dd MMM yyyy')
                          .format(volunteerFormViewModel.dueDate1),
                      style: const TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 12,
                      ),
                    ),
                    SvgPicture.asset('assets/date_icon.svg')
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textForVolunteer('Tanggal Selesai'),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                volunteerFormViewModel.setDate2(context);
              },
              child: Container(
                padding: EdgeInsets.only(
                  left: size.width * 0.02,
                  right: size.width * 0.02,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff8CA2CE).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xff8CA2CE),
                  ),
                ),
                height: size.height * 0.05,
                width: size.width * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('dd MMM yyyy')
                          .format(volunteerFormViewModel.dueDate2),
                      style: const TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 12,
                      ),
                    ),
                    SvgPicture.asset('assets/date_icon.svg')
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
