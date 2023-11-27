import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/home/widget/searchbar_widget.dart';
import 'package:flutter_raih_peduli/screen/view/home/widget/notification_widget.dart';
import 'package:flutter_raih_peduli/screen/view/home/widget/bookmark_widget.dart';
import 'package:flutter_raih_peduli/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.secondaryColor,
      elevation: 0,
      actions: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: SearchBarWidget()),
              NotificationWidget(),
              BookmarkWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
