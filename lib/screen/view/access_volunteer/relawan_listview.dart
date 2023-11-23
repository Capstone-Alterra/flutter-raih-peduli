import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/volunteer_data.dart';
import 'package:flutter_raih_peduli/screen/view/access_volunteer/widget/relawan_card_widget.dart';

class RelawanListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
