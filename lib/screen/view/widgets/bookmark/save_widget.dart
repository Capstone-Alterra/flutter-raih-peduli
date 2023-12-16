import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaveWidgetFixed extends StatelessWidget {
  String bookmarkId;
  VoidCallback? onPressed;

  SaveWidgetFixed({super.key, required this.bookmarkId, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconButton(
        icon: Icon(
            bookmarkId != "" ? Icons.bookmark : Icons.bookmark_border_outlined,
            color: AppTheme.primaryColor), // Asset ikon bookmark
        onPressed: onPressed,
      ),
    );
  }
}
