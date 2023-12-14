import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget textFormFieldCreateFundraises({
  Widget? prefixIcon,
  required TextEditingController controller,
  String? labelText,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
  String? Function(String?)? validator,
  TextCapitalization textCapitalization = TextCapitalization.none,
  int? maxLine,
}) {
  return TextFormField(
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    maxLines: maxLine,
    inputFormatters: inputFormatters,
    controller: controller,
    decoration: InputDecoration(
      prefix: prefixIcon,
      contentPadding: const EdgeInsets.all(8),
      hintText: labelText,
      hintStyle: const TextStyle(
        color: Color.fromARGB(255, 112, 112, 112),
        fontFamily: 'Helvetica',
        fontSize: 12,
      ),
      filled: true,
      fillColor: const Color.fromARGB(79, 140, 162, 206),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    validator: validator,
  );
}
