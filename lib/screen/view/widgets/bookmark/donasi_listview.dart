import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/card_fundraise_bookmark.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmark.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class DonasiListView extends StatelessWidget {
  final List<Fundraise> fundraiseData;
  const DonasiListView({super.key, required this.fundraiseData});

  @override
  Widget build(BuildContext context) {
    final viewModelBookmark = Provider.of<ViewModelBookmark>(context, listen: false);
    return viewModelBookmark.bookmarkModel!.data.fundraise.isEmpty ? Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            'Tidak ada donasi yang disimpan',
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
                'Donasi',
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
        for(Fundraise data in fundraiseData)
          CardFundraiseBookmark(fundraise: data)
      ],
    );
  }
}
