import 'package:flutter/material.dart';

import '../../view_model/view_model_news.dart';
// import '../../../view_model/view_model_news.dart';

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

void showFilterBottomSheet(BuildContext context, NewsViewModel news) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        width:
            MediaQuery.of(context).size.width, // Set lebar ke lebar layar penuh
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 170),
                      child: Text(
                        'Filter',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                _buildFilterOption('Lokasi', [
                  'Jabodetabek',
                  'Bandung',
                  'Semarang',
                  'Medan',
                  'Surabaya',
                  'Lampung'
                ]),
                _buildFilterOption('Skill Yang Di perlukan',
                    ['Pendidikan', 'Teknologi', 'Kesehatan', 'Komunikasi']),
                _buildFilterOption(
                    'Partisipan Agensi', ['50 - 70', '80 - 90', '100 - 120']),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF293066),
                    ),
                  ),
                  child: const Text(
                    'Simpan Filters',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
