// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
// import 'package:flutter_raih_peduli/model/model_chat_bot.dart';
// import 'package:flutter_raih_peduli/theme.dart';

class ChatBubble extends StatelessWidget {
  String tanya;
  // final Data chatBotData;
  final bool isSender;

  ChatBubble({
    super.key,
    // required this.chatBotData,
    required this.isSender,
    required this.tanya,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String timestamp = "${now.hour}:${now.minute}";
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
      child: Container(
        alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: size.width / 1.3,
              decoration: const BoxDecoration(
                color: Color(0xff293066),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(0.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tanya,
                  style: TextStyle(
                    color: const Color(0xffFFFFFF),
                    fontFamily: 'Helvetica',
                    fontSize: size.height / 50,
                  ),
                ),
              ),
            ),
            Text(
              "Pengguna $timestamp",
              style: TextStyle(
                color: const Color(0xff293066),
                fontFamily: 'Helvetica',
                fontSize: size.height / 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
