import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class SearchAndFilterBarDonate extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearchChanged;
  final VoidCallback onFilterPressed;

  const SearchAndFilterBarDonate({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    final viewModelFundraise =
        Provider.of<FundraisesViewModel>(context, listen: false);
    final sp = Provider.of<SignInViewModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          // Search Bar
          Expanded(
            child: TextField(
              controller: viewModelFundraise.search,
              onChanged: (text) async {
                final String query = viewModelFundraise.search.text;
                await viewModelFundraise.fetchSearchDonation(
                    query: query,
                    refreshToken: sp.refreshTokenSharedPreference,
                    accessToken: sp.accessTokenSharedPreference);
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
        ],
      ),
    );
  }
}
