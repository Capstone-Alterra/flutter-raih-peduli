import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/bookmark_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/notification_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/homescreen/searchbar_widget.dart';
import 'package:flutter_raih_peduli/theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.secondaryColor,
      elevation: 0,
      actions: const [
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
