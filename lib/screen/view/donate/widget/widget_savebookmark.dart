import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme/theme.dart';

class SaveBookmark extends StatelessWidget {
  const SaveBookmark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 36,
        height: 36,
        padding: const EdgeInsets.all(1),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: AppTheme.ornamentDarkColor,
        ),
        child: IconButton(
          icon: Image.asset('assets/icons/bookmark.png'),
          onPressed: () {},
        ),
      ),
    );
  }
}
