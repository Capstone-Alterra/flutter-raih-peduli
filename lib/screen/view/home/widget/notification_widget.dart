import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/icons/notification.png'), // Asset ikon notifikasi
      onPressed: () {
        // Aksi ketika tombol notifikasi ditekan
        /*
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return NotificationPage();
          }),
        );
        */
      },
    );
  }
}
