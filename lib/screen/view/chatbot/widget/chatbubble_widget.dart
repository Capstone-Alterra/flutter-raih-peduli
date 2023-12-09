// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
// import 'package:flutter_raih_peduli/screen/view_model/view_model_chatbot.dart';
import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  String tanya;
  DateTime time;
  final bool isSender;

  ChatBubble({
    super.key,
    required this.time,
    required this.isSender,
    required this.tanya,
  });

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat.Hm().format(
      time.toUtc().add(
            const Duration(hours: 7),
          ),
    );
    // final viewModel = Provider.of<ChatbotViewModel>(context, listen: false);
    // String displayText =
    //     viewModel.isLoading ? viewModel.messageController.text : tanya;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
      child: Container(
        alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: size.width / 1.3,
              ),
              child: Container(
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
                    // displayText,
                    tanya,
                    style: TextStyle(
                      color: const Color(0xffFFFFFF),
                      fontFamily: 'Helvetica',
                      fontSize: size.height / 50,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "Pengguna $formattedTime",
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
