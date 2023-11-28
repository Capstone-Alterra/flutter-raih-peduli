import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_chatbot.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class RoundedTextField extends StatelessWidget {
  final TextEditingController controller;

  const RoundedTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ChatbotViewModel>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16.0, right: 16, bottom: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Tanyakan Apapun...',
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: AppTheme.secondaryColor.withOpacity(0.2),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: AppTheme.primaryColor),
                    onPressed: () {
                      viewModel.sendMessage(); // Panggil sendMessage langsung dari viewModel
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
