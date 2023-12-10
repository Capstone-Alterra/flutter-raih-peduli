import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_chat_bot.dart';

import '../utils/utils.dart';

class ChatbotService {
  final Dio _dio = Dio();

  Future<ModelChatBot> hitChatBot({
    required String query,
  }) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.chatBot,
        data: {
          'message': query,
        },
      );
      debugPrint("=>${response.data}");
      return ModelChatBot.fromJson(response.data);
      // ignore: deprecated_member_use
    } on DioError catch (_) {
      rethrow;
    }
  }
}
