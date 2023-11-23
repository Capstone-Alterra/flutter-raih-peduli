import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/access_volunteer/relawan_listview.dart';
import 'package:flutter_raih_peduli/screen/view/access_volunteer/widget/bottomsheet.dart';
import 'package:flutter_raih_peduli/screen/view/access_volunteer/widget/floating_button.dart';
import 'package:flutter_raih_peduli/screen/view/access_volunteer/widget/header_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_access_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmarkscreen.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class AccessVolunteerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

                  SizedBox(child: RelawanListView()),
                ],
              ),
            ),
            Consumer<AccessVolunteerViewModel>(
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


