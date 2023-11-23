import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme.dart';

class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  Set<String> selectedOptions = Set<String>();

  @override
  Widget build(BuildContext context) {
    bool isSaveButtonVisible = selectedOptions.isNotEmpty;

    return SizedBox(
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
                    padding: EdgeInsets.only(left: 160),
                    child: Text(
                      'Filter',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
              _buildFilterOption('Skill Yang Diperlukan', ['Pendidikan', 'Teknologi', 'Kesehatan', 'Komunikasi']),
              _buildFilterOption('Partisipan Agensi', ['50 - 70', '80 - 90', '100 - 120']),
              Visibility(
                visible: isSaveButtonVisible,
                child: ElevatedButton(
                  onPressed: () {
                    // Apply filters here
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0), // Sesuaikan lebar sesuai kebutuhan
                    backgroundColor: AppTheme.primaryColor, // Sesuaikan warna sesuai kebutuhan
                  ),
                  child: const Text('Simpan Filters'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterOption(String title, List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0), // Sesuaikan dengan kebutuhan ruang di atas dan di bawah
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: AppTheme.primaryColor, // Warna biru untuk judul
            ),
          ),
          const SizedBox(height: 4.0),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: options.map((option) {
                    return ChoiceChip(
                      label: Text(option),
                      selected: selectedOptions.contains(option),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            selectedOptions.add(option);
                          } else {
                            selectedOptions.remove(option);
                          }
                        });
                      },
                      labelStyle: TextStyle(
                        color: selectedOptions.contains(option) ? AppTheme.primaryColor : Colors.grey,
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: AppTheme.primaryColor.withOpacity(0.2),
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: selectedOptions.contains(option) ? AppTheme.primaryColor : Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    context: context,
    isScrollControlled: true, // Set isScrollControlled menjadi true
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.7, // Sesuaikan tinggi bottom sheet sesuai kebutuhan
          child: FilterBottomSheet(),
        ),
      );
    },
  );
}