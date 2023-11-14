import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_homescreeen.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenViewModel>(context, listen: false);

    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 14, 0, 14),
        child: TextFormField(
          controller: TextEditingController(text: provider.searchText),
          onChanged: (text) {
            provider.setSearchText(text);
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Image.asset('assets/icons/search.png'),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(25.0), right: Radius.circular(25.0)),
            ),
          ),
        ));
  }
}