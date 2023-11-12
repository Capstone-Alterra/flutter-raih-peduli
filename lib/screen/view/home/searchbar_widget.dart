import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_homescreeen.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenViewModel>(context, listen: false);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: TextEditingController(text: provider.searchText),
              onChanged: (text) {
                provider.setSearchText(text);
              },
              decoration: InputDecoration(
                labelText: 'Cari...',
                prefixIcon: Image.asset('assets/icons/search.png'),
                suffixIcon: provider.searchText.isNotEmpty
                    ? Image.asset('assets/icons/search.png')
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
