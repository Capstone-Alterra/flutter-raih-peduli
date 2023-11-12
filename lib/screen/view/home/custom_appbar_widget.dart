import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/home/searchbar_widget.dart';
import 'package:flutter_raih_peduli/screen/view/home/notification_widget.dart';
import 'package:flutter_raih_peduli/screen/view/home/bookmark_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
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

