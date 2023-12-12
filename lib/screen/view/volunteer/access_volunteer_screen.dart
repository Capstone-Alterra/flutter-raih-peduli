import 'package:flutter/material.dart';
// import 'package:flutter_raih_peduli/screen/view/volunteer/relawan_listview.dart';
import 'package:flutter_raih_peduli/screen/view/volunteer/volunteer_search.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/bottomsheet.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/floating_button.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/header_widget.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/relawan_card_widget.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_bookmarkscreen.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';

class AccessVolunteerScreen extends StatefulWidget {
  const AccessVolunteerScreen({super.key});

  @override
  State<AccessVolunteerScreen> createState() => _AccessVolunteerScreenState();
}

class _AccessVolunteerScreenState extends State<AccessVolunteerScreen> {
  late VolunteerViewModel viewModel;
  late SignInViewModel sp;
  @override
  void initState() {
    viewModel = Provider.of<VolunteerViewModel>(context, listen: false);
    sp = Provider.of<SignInViewModel>(context, listen: false);
    viewModel.awal();
    viewModel.scrollController.addListener(viewModel.scrollListener);
    viewModel.fetchNewsPagination();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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

                  Consumer<VolunteerViewModel>(
                    builder: (context, contactModel, child) {
                      return viewModel.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : viewModel.isSearch
                              ? Column(
                                  children: [
                                    if (viewModel.dataHasilSearch)
                                      const Center(
                                          child: Text(
                                        'Pencarian Tidak Ditemukan',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.red,
                                        ),
                                      ))
                                    else if (!viewModel.dataHasilSearch)
                                      for (var newsItem
                                          in viewModel.modelVolunteer!.data)
                                        RelawanCardSearch(
                                          volunteerData: newsItem,
                                        )
                                  ],
                                )
                              : SizedBox(
                                  height: size.height / 1.3,
                                  child: ListView.builder(
                                    controller: viewModel.scrollController,
                                    itemCount: viewModel
                                        .modelVolunteerPagination!.data.length,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                          height: 130,
                                          child: RelawanCard(
                                            volunteerData: viewModel
                                                .modelVolunteerPagination!
                                                .data[index],
                                          ));
                                    },
                                  ),
                                );
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
        floatingActionButton: Consumer<SignInViewModel>(
          builder: (context, contactModel, child) {
            return const CustomFloatingButton();
          },
        ),
      ),
    );
  }
}
