import 'package:flutter/material.dart';

class SaveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconButton(
        icon: Image.asset('assets/icons/bookmark.png'), // Asset ikon bookmark
        onPressed: () {
        },
      ),
    );
  }
}
