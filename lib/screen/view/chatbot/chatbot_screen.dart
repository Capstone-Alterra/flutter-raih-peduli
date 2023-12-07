// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/chatbot/widget/chatbubble_widget.dart';
import 'package:flutter_raih_peduli/screen/view/chatbot/widget/textfield_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_chatbot.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../view_model/view_model_signin.dart';
import 'widget/chatbubble_reply.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  late ChatbotViewModel viewModel;
  late SignInViewModel sp;
  @override
  void initState() {
    viewModel = Provider.of<ChatbotViewModel>(context, listen: false);
    sp = Provider.of<SignInViewModel>(context, listen: false);
    sp.setSudahLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Chatbot',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontFamily: 'Helvetica',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<SignInViewModel>(
        builder: (context, contactModel, child) {
          return sp.isSudahLogin
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<ChatbotViewModel>(
                        builder: (context, viewMode, child) {
                          return SizedBox(
                            height: size.height / 1.55,
                            child: viewModel.chatList.isEmpty
                                ? Center(
                                    child: SvgPicture.asset(
                                      "assets/chatBotKosong.svg",
                                    ),
                                  )
                                : SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        for (var chatData in viewModel.chatList)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 5,
                                            ),
                                            child: Column(
                                              children: [
                                                ChatBubble(
                                                  time: chatData.questionTime,
                                                  tanya: chatData.question,
                                                  isSender: false,
                                                ),
                                                ChatBotReply(
                                                  time: chatData.replyTime,
                                                  jawaban: chatData.reply,
                                                  isSender: true,
                                                ),
                                              ],
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: Text("Anda Belum Login"),
                );
        },
      ),
      bottomNavigationBar: Consumer<SignInViewModel>(
        builder: (context, contactModel, child) {
          return sp.isSudahLogin
              ? RoundedTextField(controller: viewModel.messageController)
              : const SizedBox(height: 1);
        },
      ),
    );
  }
}
