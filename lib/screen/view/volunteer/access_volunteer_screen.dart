import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/relawan_listview.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/bottomsheet.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/floating_button.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/header_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmarkscreen.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class AccessVolunteerScreen extends StatelessWidget {
  const AccessVolunteerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<VolunteerViewModel>(context, listen: false);
    return ChangeNotifierProvider(
      create: (context) => BookmarkScreenViewModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Relawan',
            style: TextStyle(
                color: AppTheme.primaryColor,
                fontFamily: 'Helvetica',
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppTheme.primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header Widget
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchAndFilterBar(
                      searchController: TextEditingController(),
                      onSearchChanged: (text) {},
                      onFilterPressed: () {
                        showFilterBottomSheet(context);
                      },
                    ),
                  ),

                  // Add your content widgets below the header
                  // ...

                  Consumer<VolunteerViewModel>(
                    builder: (context, isLoading, child) {
                      return SizedBox(
                          child: viewModel.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : RelawanListView());
                    },
                  ),
                ],
              ),
            ),
            Consumer<VolunteerViewModel>(
              builder: (context, overlayProvider, child) {
                return IgnorePointer(
                  ignoring: !overlayProvider.isOverlayVisible,
                  child: AnimatedOpacity(
                    opacity: overlayProvider.isOverlayVisible ? 0.6 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: CustomFloatingButton(),
        ),
      ),
    );
  }
}
