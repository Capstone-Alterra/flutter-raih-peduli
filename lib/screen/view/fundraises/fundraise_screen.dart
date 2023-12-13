// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer.dart';
import 'package:provider/provider.dart';
import '../../../theme.dart';
// import '../widgets/volunteer/header_widget.dart';
import '../../view_model/view_model_signin.dart';
import '../widgets/volunteer/floating_button.dart';
import '../widgets/volunteer/header_widget.dart';
import 'card_fundraise.dart';

class FundraiseScreen extends StatefulWidget {
  const FundraiseScreen({super.key});

  @override
  State<FundraiseScreen> createState() => _FundraiseScreenState();
}

class _FundraiseScreenState extends State<FundraiseScreen> {
  late FundraisesViewModel viewModel;
  late VolunteerViewModel viewModelVolunteer;
  late SignInViewModel sp;

  @override
  void initState() {
    viewModel = Provider.of<FundraisesViewModel>(context, listen: false);
    viewModelVolunteer =
        Provider.of<VolunteerViewModel>(context, listen: false);
    sp = Provider.of<SignInViewModel>(context, listen: false);
    viewModel.awal();
    viewModelVolunteer.overlay();
    super.initState();
    viewModel.scrollController.addListener(viewModel.scrollListener);
    viewModel.fetchAllFundraisesPagination();
    sp.setSudahLogin();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Donasi',
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchAndFilterBar(
                    searchController: TextEditingController(),
                    onSearchChanged: (text) {},
                    onFilterPressed: () {
                      // showFilterBottomSheet(context);
                    },
                  ),
                ),
                Consumer<FundraisesViewModel>(
                  builder: (context, isLoading, child) {
                    return viewModel.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            height: size.height / 1.3,
                            child: ListView.builder(
                              controller: viewModel.scrollController,
                              itemCount: viewModel
                                  .modelFundraisesPagination!.data.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 150,
                                  child: CardFundraise(
                                    fundraise: viewModel
                                        .modelFundraisesPagination!.data[index],
                                  ),
                                );
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
    );
  }

  // void scrollListener() {
  //   if (scrollController.position.pixels ==
  //       scrollController.position.maxScrollExtent) {
  //     print("coba");
  //     // viewModel.fetchAllFundraisesPagination();
  //   }
  // }
}
