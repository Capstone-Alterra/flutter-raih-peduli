import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/bookmark/bookmarkscreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookmarkWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconButton(
        icon: SvgPicture.asset('assets/bookmark.svg'), // Asset ikon bookmark
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return BookmarkScreen();
            }),
          );
        },
      ),
    );
  }
}
