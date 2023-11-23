import 'package:flutter/material.dart';

Widget _buildFilterOption(String title, List<String> options) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8.0),
      Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: options.map((option) {
          return FilterChip(
            label: Text(option),
            onSelected: (bool selected) {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: const BorderSide(
                color: Colors.grey,
              ),
            ),
            selected: false,
            selectedColor: Colors.blue,
            checkmarkColor: Colors.white,
          );
        }).toList(),
      ),
      const SizedBox(height: 16.0),
    ],
  );
}
