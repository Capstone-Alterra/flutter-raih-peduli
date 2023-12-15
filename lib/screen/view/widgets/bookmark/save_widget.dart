import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaveWidget extends StatelessWidget {
  const SaveWidget({super.key});

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
