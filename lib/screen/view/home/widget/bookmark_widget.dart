import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/bookmark/bookmarkscreen.dart';

class BookmarkWidget extends StatelessWidget {
  const BookmarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconButton(
        icon: Image.asset('assets/icons/bookmark.png'), // Asset ikon bookmark
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const BookmarkScreen();
            }),
          );
        },
      ),
    );
  }
}
