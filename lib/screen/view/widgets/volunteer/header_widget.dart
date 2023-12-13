import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class SearchAndFilterBar extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearchChanged;
  final VoidCallback onFilterPressed;

  const SearchAndFilterBar({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<VolunteerViewModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          // Search Bar
          Expanded(
            child: TextField(
              controller: viewModel.search,
              onChanged: (text) async {
                final String query = viewModel.search.text;
                await viewModel.fetchSearchVolunteer(query: query);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: AppTheme.primaryColor.withOpacity(0.1),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 24.0,
                ),
                hintText: 'Cari...',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
