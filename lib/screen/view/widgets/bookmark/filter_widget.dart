import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme/theme.dart';

class FilterWidget extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterSelected;

  const FilterWidget({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FilterButton(
          text: 'Semua',
          isActive: selectedFilter == 'Semua',
          onPressed: () {
            onFilterSelected('Semua');
          },
        ),
        FilterButton(
          text: 'Donasi',
          isActive: selectedFilter == 'Donasi',
          onPressed: () {
            onFilterSelected('Donasi');
          },
        ),
        FilterButton(
          text: 'Relawan',
          isActive: selectedFilter == 'Relawan',
          onPressed: () {
            onFilterSelected('Relawan');
          },
        ),
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onPressed;

  const FilterButton({
    super.key,
    required this.text,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? Colors.white : Colors.white,
        side: isActive
            ? const BorderSide(color: AppTheme.primaryColor, width: 2)
            : const BorderSide(color: Colors.grey, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? AppTheme.primaryColor : Colors.grey,
        ),
      ),
    );
  }
}
