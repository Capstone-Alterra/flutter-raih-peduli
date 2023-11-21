import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/bookmark/bookmark_listview.dart';
import 'package:flutter_raih_peduli/screen/view/bookmark/widget/filter_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmarkscreen.dart';
import 'package:flutter_raih_peduli/theme/theme.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookmarkScreenViewModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Disimpan',
            style: TextStyle(
                color: AppTheme.primaryColor,
                fontFamily: 'Helvetica',
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Consumer<BookmarkScreenViewModel>(
                  builder: (context, viewModel, child) {
                    return FilterWidget(
                      selectedFilter: viewModel.selectedFilter,
                      onFilterSelected: viewModel.setFilter,
                    );
                  },
                ),
                const SizedBox(height: 16),
                Consumer<BookmarkScreenViewModel>(
                  builder: (context, viewModel, child) {
                    return SizedBox(
                      height: 1120,
                      child: BookmarkListView(
                        selectedFilter: viewModel.selectedFilter,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
