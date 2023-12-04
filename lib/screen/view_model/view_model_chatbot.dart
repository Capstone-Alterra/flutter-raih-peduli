import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_chat_bot.dart';

import '../../services/service_chat_bot.dart';

class ChatbotViewModel with ChangeNotifier {
  final service = ChatbotService();
  bool isLoading = false;
  bool chatBotQuestion = false;
  final TextEditingController messageController = TextEditingController();
  ModelChatBot? modelChatBot;

  Future<void> chatBot() async {
    isLoading = true;
    final query = messageController.text;
    final data = await service.hitChatBot(query: query);
    modelChatBot = data;
    isLoading = false;
    messageController.clear();
    notifyListeners();
  }
}
