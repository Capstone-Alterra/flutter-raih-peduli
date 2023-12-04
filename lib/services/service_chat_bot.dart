import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_chat_bot.dart';

import '../utils/utils.dart';

class ChatbotService {
  final Dio _dio = Dio();
  String _apiKey = ''; // Menyimpan nilai 'key' yang diambil dari endpoint

  Future<void> fetchApiKey() async {
    try {
      final response = await _dio.get(
          'https://strapi-postgresql-sistem-informasi.onrender.com/api/ais');

      print('API Key Response Status Code: ${response.statusCode}');
      print('API Key Response Body: ${response.data}');

      if (response.statusCode == 200) {
        // Mengambil nilai 'key' dari atribut 'attributes'
        _apiKey = response.data['data'][0]['attributes']['key'].toString();
        print('API Key: $_apiKey');
      } else {
        print('Failed to fetch API key: ${response.statusCode}');
      }
    } catch (error) {
      // An error occurred
      print('Error fetching API key: $error');
    }
  }

  Future<Map<String, dynamic>?> chatbot({required String prompt}) async {
    // Fetch API key before making the chatbot request
    //await fetchApiKey();

    try {
      _dio.options = BaseOptions(
        baseUrl: 'https://api.openai.com/v1/',
        headers: {
          'Authorization':
              'Bearer $_apiKey', // Menggunakan nilai 'key' yang telah diambil
        },
      );

      final response = await _dio.post(
        'completions',
        data: {
          "model": "text-davinci-003",
          "prompt":
              "Kamu adalah seorang ahli dalam bidang kuliner dan resep masakan, kamu akan ditanyai hal seputar kuliner, resep makanan, dan tips mengolah bahan makanan. $prompt . Coba kamu sebutkan nama masakannya kemudian jelaskan bahan-bahan, langkah-langkah, waktu yang diperlukan, tingkat kesulitan dari masakan tersebut. Namun, jika kamu ditanyai tentang tips mengolah makanan, kamu dapat mengabaikan aturan sebelumnya dan menjelaskan tips yang ditanyakan", // Menambahkan ide bahwa AI adalah ahli kuliner
          "temperature": 0.4,
          "max_tokens": 900,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0,
        },
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.data}');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('Failed to make API request: ${response.statusCode}');
      }
    } catch (error) {
      // An error occurred
      print('Error: $error');
    }
    return null;
  }

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
