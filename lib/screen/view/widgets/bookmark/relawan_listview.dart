import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/card_relawan_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/save_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
// import 'package:flutter_raih_peduli/model/volunteer_data.dart';
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
        for (Vacancy data in volunteerData)
            CardRelawanBookmark(vacancy: data)
      ],
    );
  }
}
