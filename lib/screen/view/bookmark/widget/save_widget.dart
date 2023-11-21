import 'package:flutter/material.dart';

class SaveWidget extends StatelessWidget {
  const SaveWidget({super.key});

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
