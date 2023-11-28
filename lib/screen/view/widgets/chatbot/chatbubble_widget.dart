import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser; // Untuk menentukan apakah pesan berasal dari user atau bukan
  final String timestamp;

  // Tambahkan properti untuk menentukan apakah sedang loading
  final bool isLoading;

  const ChatBubble({super.key, 
    required this.message,
    required this.isUser,
    required this.timestamp,
    required this.isLoading, // Tambahkan properti isLoading
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Tampilkan loading indicator hanya jika chat bubble bukan dari user dan sedang loading
          if (!isUser && isLoading) ...[
            const CircularProgressIndicator(),
            const SizedBox(height: 8.0), // Beri sedikit jarak dari loading indicator
          ],
          Container(
            decoration: BoxDecoration(
              color: isUser ? AppTheme.primaryColor : AppTheme.secondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isUser ? 16.0 : 0.0),
                topRight: const Radius.circular(16.0),
                bottomLeft: const Radius.circular(16.0),
                bottomRight: Radius.circular(isUser ? 0.0 : 16.0),
              ),
            ),
            padding: const EdgeInsets.all(12.0),
            child: Text(
              message,
              style: TextStyle(
                color: isUser ? AppTheme.white : AppTheme.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            isUser ? 'Pengguna $timestamp' : 'AI $timestamp',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
