// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/chatbot/widget/chatbubble_widget.dart';
import 'package:flutter_raih_peduli/screen/view/chatbot/widget/textfield_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_chatbot.dart';
// import 'package:flutter_raih_peduli/screen/view_model/view_model_homescreeen.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

import 'widget/chatbubble_reply.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  late ChatbotViewModel viewModel;
  @override
  void initState() {
    viewModel = Provider.of<ChatbotViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Chatbot',
          style: TextStyle(
              color: AppTheme.primaryColor,
              fontFamily: 'Helvetica',
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppTheme.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<ChatbotViewModel>(
              builder: (context, viewMode, child) {
                final data = viewModel.modelChatBot?.data;
                final tanya = data?.question ?? "";
                final jawab = data?.reply ?? "";
                return SizedBox(
                  height: size.height / 1.55,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ChatBubble(tanya: tanya, isSender: false),
                        ChatBotReply(jawaban: jawab, isSender: true),
                      ],
                    ),
                  ),
                );
              },
            ),
            Consumer<ChatbotViewModel>(
              builder: (context, viewModel, child) {
                return RoundedTextField(
                    controller: viewModel.messageController);
              },
            ),
          ],
        ),
      ),
    );
  }
}
