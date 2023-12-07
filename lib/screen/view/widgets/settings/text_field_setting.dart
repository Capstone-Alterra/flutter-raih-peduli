import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget textFieldSetting({
  required TextEditingController controller,
  String? labelText,
  bool? obscureText,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
  String? Function(String?)? validator,
  TextCapitalization textCapitalization = TextCapitalization.none,
}) {
  return TextFormField(
    cursorColor: Colors.black,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
    controller: controller,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      hintText: labelText,
      hintStyle: const TextStyle(
        color: Color(0xFFB0B0B0),
      ),
      labelStyle: const TextStyle(
        color: Colors.blueGrey,
      ),
      border: InputBorder.none,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
    ),
    validator: validator,
  );
}
                  // TextField(
                  //   controller: viewModel.fullNameController,
                  //   cursorColor: Colors.black,
                  //   autocorrect: true,
                  //   style: const TextStyle(color: Colors.black),
                  //   decoration: InputDecoration(
                  //     enabledBorder: const UnderlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.black, width: 2),
                  //     ),
                  //     focusedBorder: const UnderlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.black, width: 2),
                  //     ),
                  //     hintText: widget.fullname,
                  //     hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                  //   ),
                  // ),