// import 'package:flutter/material.dart';
// import 'package:flutter_raih_peduli/model/model_bookmark.dart';
// import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/donasi_listview.dart';
// import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/relawan_listview.dart';
// import 'package:flutter_raih_peduli/screen/view/widgets/bookmark/semua_listview.dart';

// class BookmarkListView extends StatelessWidget {
//   final String selectedFilter;
//   final Data data;

//   const BookmarkListView({super.key, required this.selectedFilter, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     if (selectedFilter == 'Donasi') {
//       return const SizedBox(child: DonasiListView());
//     } else if (selectedFilter == 'Relawan') {
//       return const SizedBox(child: RelawanListView());
//     } else if (selectedFilter == 'News') {
//       return const SizedBox(child: RelawanListView());
//     } else if (selectedFilter == 'Semua') {
//       return const SizedBox(child: SemuaListViewBuilder());
//     }

//     return const SizedBox(
//       height: 0,
//     );
//   }
// }
