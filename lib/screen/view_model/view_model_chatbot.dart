// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_chat_bot.dart';

import '../../services/service_chat_bot.dart';

class ChatbotViewModel with ChangeNotifier {
  final service = ChatbotService();
  bool isLoading = false;
  bool chatBotQuestion = false;
  final TextEditingController messageController = TextEditingController();
  ModelChatBot? modelChatBot;
  List<Data> chatList = [];
  // bool isKosong = false;

  Future<void> chatBot(String waktu) async {
    isLoading = true;
    final query = messageController.text;
    final data = await service.hitChatBot(query: query);
    modelChatBot = data;
    isLoading = false;

    if (data != null && data.data != null) {
      chatList.add(data.data);
    }
    // isKosong = false;
    messageController.clear();
    notifyListeners();
  }

  // void setDataKosong() {
  //   if (chatList != []) {
  //     isKosong = true;
  //   } else {
  //     isKosong = false;
  //   }
  //   notifyListeners();
  // }
}
