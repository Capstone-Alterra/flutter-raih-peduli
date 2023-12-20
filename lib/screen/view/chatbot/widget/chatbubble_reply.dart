// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import '../../../../model/model_chat_bot.dart';

class ChatBotReply extends StatelessWidget {
  DateTime time;
  String jawaban;
  final bool isSender;

  ChatBotReply({
    super.key,
    required this.time,
    required this.isSender,
    required this.jawaban,
  });

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat.Hm().format(
      time.toUtc().add(
            const Duration(hours: 7),
          ),
    );
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
      child: Container(
        alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: size.width / 1.3,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffD1DAEC),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    jawaban,
                    style: TextStyle(
                      color: const Color(0xff293066),
                      fontFamily: 'Helvetica',
                      fontSize: size.height / 50,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "AI - Raih Peduli $formattedTime",
              style: TextStyle(
                color: const Color(0xff5D5D5D),
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
