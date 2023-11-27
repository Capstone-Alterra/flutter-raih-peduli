import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/bookmark/widget/donasi_listview.dart';
import 'package:flutter_raih_peduli/screen/view/bookmark/widget/relawan_listview.dart';
import 'package:flutter_raih_peduli/screen/view/bookmark/widget/semua_listview.dart';

class BookmarkListView extends StatelessWidget {
  final String selectedFilter;

  const BookmarkListView({super.key, required this.selectedFilter});

  @override
  Widget build(BuildContext context) {
    if (selectedFilter == 'Donasi') {
      return SizedBox(child: DonasiListView());
    } else if (selectedFilter == 'Relawan') {
      return SizedBox(child: RelawanListView());
    } else if (selectedFilter == 'Semua') {
      return SizedBox(child: SemuaListViewBuilder());
    }

    return const SizedBox(
      height: 0,
    );
  }
}
