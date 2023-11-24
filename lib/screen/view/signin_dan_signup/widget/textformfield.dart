import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget customTextFormField({
  required TextEditingController controller,
  Widget? prefixIcon,
  String? labelText,
  bool? obscureText,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
  String? Function(String?)? validator, 
}) {
  return TextFormField(
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
    controller: controller,
    obscureText: obscureText ?? false,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      filled: true,
      fillColor: Colors.white,
      hintText: labelText,
      hintStyle: const TextStyle(
        color: Color(0xFFB0B0B0),
      ),
      labelStyle: const TextStyle(
        color: Colors.blueGrey,
      ),
      prefixIcon: prefixIcon,
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
    ),
    validator: validator,
  );
}
