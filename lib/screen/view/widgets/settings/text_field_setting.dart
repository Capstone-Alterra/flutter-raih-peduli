import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget textFieldSetting({
  required TextEditingController controller,
  String? labelText,
  bool? obscureText,
  bool? enable,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
  String? Function(String?)? validator,
  TextCapitalization textCapitalization = TextCapitalization.none,
}) {
  return TextFormField(
    enabled: enable,
    cursorColor: Colors.black,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
    controller: controller,
    decoration: InputDecoration(
      hintText: labelText,
      hintStyle: const TextStyle(
        color: Color(0xFFB0B0B0),
      ),
      labelStyle: const TextStyle(
        color: Colors.blueGrey,
      ),
      border: InputBorder.none,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    ),
    validator: validator,
  );
}
