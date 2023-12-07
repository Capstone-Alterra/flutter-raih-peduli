// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_chat_bot.dart';

import '../../services/service_chat_bot.dart';

class ChatbotViewModel with ChangeNotifier {
  final service = ChatbotService();
  // bool isLoading = false;
  bool chatBotQuestion = false;
  final TextEditingController messageController = TextEditingController();
  ModelChatBot? modelChatBot;
  List<Data> chatList = [];

  Future<void> chatBot() async {
    final query = messageController.text;

    chatList.add(Data(
      question: query,
      questionTime: DateTime.now(),
      reply: 'Tunggu...',
      replyTime: DateTime.now(),
    ));
    notifyListeners();
    messageController.clear();
    final data = await service.hitChatBot(query: query);

    if (data != null && data.data != null) {
      chatList.last.question = data.data.question;
      chatList.last.reply = data.data.reply;
      chatList.last.replyTime = data.data.replyTime;
    }

    notifyListeners();
  }
}
