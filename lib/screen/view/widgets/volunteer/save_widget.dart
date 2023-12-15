import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SaveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconButton(
        icon: SvgPicture.asset('assets/bookmark.svg'), // Asset ikon bookmark
        onPressed: () {
        },
      ),
    );
  }
}
