import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/volunteer_data.dart';
import 'package:flutter_raih_peduli/screen/view/access_volunteer/widget/relawan_card_widget.dart';
import 'package:flutter_raih_peduli/theme.dart';

class VolunteerListView extends StatelessWidget {
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
        SizedBox(
          height: 600,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: dummyVolunteerData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  child: RelawanCard(
                    volunteerData: dummyVolunteerData[index],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
