// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/chatbot/chatbubble_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/chatbot/textfield_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_chatbot.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_homescreeen.dart';
import 'package:flutter_raih_peduli/theme/theme.dart';
import 'package:provider/provider.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final homeScreenViewModel = HomeScreenViewModel();
  late final ChatbotViewModel chatbotViewModel;

  /*@override
  void initState() {
    super.initState();
    // Inisialisasi chatbotViewModel dan panggil fetchApiKey
    chatbotViewModel = ChatbotViewModel();
    chatbotViewModel.fetchApiKey();
  }*/

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          // Chat bubbles
          Expanded(
            child: Consumer<ChatbotViewModel>(
              builder: (context, viewModel, child) {
                return ListView.builder(
                  itemCount: viewModel.messages.length,
                  itemBuilder: (context, index) {
                    final message = viewModel.messages[index];
                    return ChatBubble(
                      message: message.text,
                      isUser: message.isUser,
                      timestamp: message.timestamp,
                      isLoading: index == viewModel.messages.length - 1 &&
                          viewModel
                              .isLoading, // Menunjukkan loading pada index terakhir
                    );
                  },
                );
              },
            ),
          ),
          // Rounded textfield
          Consumer<ChatbotViewModel>(
            builder: (context, viewModel, child) {
              return RoundedTextField(controller: viewModel.messageController);
            },
          ),
        ],
      ),
    );
  }
}
