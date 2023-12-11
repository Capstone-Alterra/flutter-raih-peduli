// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_fundraise_pagination.dart';
import 'package:flutter_raih_peduli/model/model_fundraises.dart';
import 'package:flutter_raih_peduli/services/service_fundraises.dart';

import '../../model/model_detail_fundraises.dart';

class FundraisesViewModel with ChangeNotifier {
  ModelFundraises? modelFundraises;
  ModelDetailFundraises? modelDetailFundraises;
  final TextEditingController amountController = TextEditingController();
  ModelFundraisesPagination? modelFundraisesPagination;
  final service = FundraisesService();
  bool isLoading = false;
  bool isDetail = false;

  updateAmount(String amount) {
    amountController.text = amount;
    notifyListeners();
  }

  late final scrollController = ScrollController();
  int indexPagination = 1;

  Future fetchAllFundraisesPagination() async {
    try {
      isLoading = true;
      modelFundraisesPagination =
          await service.hitAllFundraisesPagination(indexPagination);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }

  void awal() async {
    indexPagination = 1;
  }

  void scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      indexPagination++;
      notifyListeners();
      final newData = await service.hitAllFundraisesPagination(indexPagination);
      modelFundraisesPagination?.addAllData(newData.data);
    }
    notifyListeners();
  }

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}...';
  }

  Future fetchDetailfundraises({
    required int id,
  }) async {
    try {
      isDetail = false;
      modelDetailFundraises = await service.hitDetailFundraises(
        id: id,
      );
        isDetail = true;
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }
}
