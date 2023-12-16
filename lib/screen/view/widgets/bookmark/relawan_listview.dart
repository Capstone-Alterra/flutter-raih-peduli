import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/card_relawan_bookmark.dart';
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
    final viewModelBookmark = Provider.of<ViewModelBookmark>(context, listen: false);
    return viewModelBookmark.bookmarkModel!.data.vacancy.isEmpty ? Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              'Tidak ada volunteer yang disimpan',
              style: TextStyle(
                color: AppTheme.tertiaryColor.withOpacity(0.9),
                fontFamily: 'Helvetica',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
    ) : Column(
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
