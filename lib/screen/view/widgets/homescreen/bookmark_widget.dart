import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/bookmark/bookmarkscreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

import '../../../view_model/view_model_signin.dart';
import '../login_signup/alert.dart';

class BookmarkWidget extends StatelessWidget {
  const BookmarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sp = Provider.of<SignInViewModel>(context, listen: false);
    return Consumer<SignInViewModel>(
      builder: (context, contactModel, child) {
        if (sp.isSudahLogin == true) {
          return IconButton(
            icon: SvgPicture.asset('assets/bookmark.svg'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const BookmarkScreen();
                }),
              );
            },
          );
        } else {
          return IconButton(
            icon: SvgPicture.asset('assets/bookmark.svg'),
            onPressed: () {
              customAlert(
                context: context,
                alertType: QuickAlertType.error,
                text: 'Anda belum melakukan login',
              );
            },
          );
        }
      },
    );
  }
}
