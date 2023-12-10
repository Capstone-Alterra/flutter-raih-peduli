// import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/model/model_fundraises.dart';
import 'package:flutter_raih_peduli/services/service_fundraises.dart';

class FundraisesViewModel with ChangeNotifier {
  ModelFundraises? modelFundraises;
  final TextEditingController amountController = TextEditingController();
  ModelFundraisesPagination? modelFundraisesPagination;
  final service = FundraisesService();
  bool isLoading = false;

  updateAmount(String amount){
    amountController.text = amount;
    notifyListeners();
  }

  late final scrollController = ScrollController();
  int indexPagination = 1;

  FundraisesViewModel() {
    fetchAllFundraises();
  }
  Future fetchAllFundraises() async {
    try {
      isLoading = true;
      modelFundraises = await service.hitAllFundraises();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }

  Future fetchAllFundraisesPagination() async {
    try {
      isLoading = true;
      modelFundraisesPagination =
      await service.hitAllFundraisesPagination(indexPagination);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }
  void awal() async {
    indexPagination = 1;
  }
  // void scrollListener() async {
  //   if (scrollController.position.pixels ==
  //       scrollController.position.maxScrollExtent) {
  //     indexPagination++;
  //     notifyListeners();
  //     isLoading = true;
  //     modelFundraisesPagination =
  //         await service.hitAllFundraisesPagination(indexPagination);
  //     isLoading = false;
  //   }
  //   notifyListeners();
  // }
  void scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      indexPagination++;
      notifyListeners();
      final newData = await service.hitAllFundraisesPagination(indexPagination);
      modelFundraisesPagination?.addAllData(newData.data);
      print("coba");
    }
    notifyListeners();
  }

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}...';
  }
}