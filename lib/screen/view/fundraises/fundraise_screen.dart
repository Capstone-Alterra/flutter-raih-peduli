// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_fundraises.dart';
import 'package:provider/provider.dart';
import '../../../theme.dart';
// import '../widgets/volunteer/header_widget.dart';
import '../widgets/volunteer/header_widget.dart';
import 'card_fundraise.dart';

class FundraiseScreen extends StatefulWidget {
  const FundraiseScreen({super.key});

  @override
  State<FundraiseScreen> createState() => _FundraiseScreenState();
}

class _FundraiseScreenState extends State<FundraiseScreen> {
  late FundraisesViewModel viewModel;
  // final scrollController = ScrollController();

  @override
  void initState() {
    viewModel = Provider.of<FundraisesViewModel>(context, listen: false);
    viewModel.awal();
    super.initState();
    viewModel.scrollController.addListener(viewModel.scrollListener);
    viewModel.fetchAllFundraisesPagination();
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
      body: SingleChildScrollView(
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
                    : Container(
                        // color: Colors.red,
                        height: size.height / 1.3,
                        child: ListView.builder(
                          controller: viewModel.scrollController,
                          itemCount:
                              viewModel.modelFundraisesPagination!.data.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 130,
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
