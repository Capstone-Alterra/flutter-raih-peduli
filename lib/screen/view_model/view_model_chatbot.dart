import 'package:flutter/material.dart';
// import 'package:flutter_raih_peduli/services/chatbot.dart';

import '../../services/service_chat_bot.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final String timestamp;
  bool isLoading; // Tambahkan properti isLoading

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.isLoading = false, // Inisialisasi isLoading dengan false
  });
}

class ChatbotViewModel extends ChangeNotifier {
  final ChatbotService _chatbotService = ChatbotService();
  final TextEditingController messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _isLoading = false; // Tambahkan properti isLoading

  List<ChatMessage> get messages =>
      _messages.reversed.toList(); // Balik urutan pesan
  bool get isLoading => _isLoading; // Getter untuk isLoading

  void sendMessage() async {
    String userMessage = messageController.text.trim();
    if (userMessage.isNotEmpty) {
      // Tambahkan chat bubble dari user
      _addMessage(userMessage, true);

      // Bersihkan input field
      messageController.clear();

      // Dapatkan indeks dari pesan yang menunggu respons
      int waitingIndex =
          _addMessage('Menunggu respons...', false, isLoading: true);

      // Dapatkan respons dari AI
      Map<String, dynamic>? aiResponse =
          await _chatbotService.chatbot(prompt: userMessage);

      if (aiResponse != null && aiResponse.containsKey('choices')) {
        String aiMessage = aiResponse['choices'][0]['text'];
        // Perbarui chat bubble AI dengan respons sebenarnya
        _updateMessage(waitingIndex, aiMessage, false, isLoading: false);
      }
    }
  }

  int _addMessage(String text, bool isUser, {bool isLoading = false}) {
    DateTime now = DateTime.now();
    String timestamp = "${now.hour}:${now.minute}";

    _messages.insert(
      0, // Menyisipkan pesan di awal daftar
      ChatMessage(
        text: text,
        isUser: isUser,
        timestamp: timestamp,
        isLoading: isLoading,
      ),
    );

    int index = 0; // Dapatkan indeks pesan yang baru ditambahkan
    notifyListeners();
    return index;
  }

  void _updateMessage(int index, String text, bool isUser,
      {bool isLoading = false}) {
    DateTime now = DateTime.now();
    String timestamp = "${now.hour}:${now.minute}";

    _messages[index] = ChatMessage(
      text: text,
      isUser: isUser,
      timestamp: timestamp,
      isLoading: isLoading,
    );

    notifyListeners();
  }
}
