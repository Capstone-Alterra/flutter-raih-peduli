import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaveWidget extends StatelessWidget {
  String bookmarkId;
  SaveWidget({super.key, required this.bookmarkId, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconButton(
        icon: Icon(bookmarkId != "" ?Icons.bookmark : Icons.bookmark_border_outlined, color: AppTheme.primaryColor), // Asset ikon bookmark
        onPressed: () {
        },
      ),
    );
  }
}
