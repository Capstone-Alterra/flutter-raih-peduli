import 'package:flutter/material.dart';

class BookmarkWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/icons/bookmark.png'), // Asset ikon bookmark
      onPressed: () {
        // Aksi ketika tombol bookmark ditekan
        /* 
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return BookmarkPage();
          }),
        );
        */
      },
    );
  }
}
