import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_access_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class SearchAndFilterBar extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearchChanged;
  final VoidCallback onFilterPressed;

  SearchAndFilterBar({
    required this.searchController,
    required this.onSearchChanged,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<AccessVolunteerViewModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          // Search Bar
          Expanded(
            child: TextField(
              controller: TextEditingController(text: provider.searchText),
              onChanged: (text) {
                provider.setSearchText(text);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: AppTheme.primaryColor.withOpacity(0.1),
                prefixIcon: Image.asset('assets/icons/search.png'),
                hintText: 'Cari...',
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20.0),
                    right: Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Filter Button
          Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: IconButton(
              onPressed: onFilterPressed,
              icon: const Icon(Icons.filter_alt_outlined),
              tooltip: 'Filter',
            ),
          ),
        ],
      ),
    );
  }
}
