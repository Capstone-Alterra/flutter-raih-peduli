import 'package:dio/dio.dart';

class ApiKeyManager {
  late String _apiKey;

  String get apiKey => _apiKey;

  // Private constructor
  ApiKeyManager._();

  static final ApiKeyManager _instance = ApiKeyManager._();

  // Getter untuk instance singleton
  static ApiKeyManager get instance => _instance;

  // Fetch API key
  Future<void> fetchApiKey() async {
    try {
      final Dio _dio = Dio();
      final response = await _dio.get('https://strapi-postgresql-sistem-informasi.onrender.com/api/ais');

      if (response.statusCode == 200) {
        _apiKey = response.data['data'][0]['attributes']['key'].toString();
        print('API Key: $_apiKey');
      } else {
        print('Failed to fetch API key: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching API key: $error');
    }
  }
}
