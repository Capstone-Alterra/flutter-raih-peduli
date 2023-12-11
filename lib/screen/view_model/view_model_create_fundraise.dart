import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_create_fundraise.dart';
import 'package:flutter_raih_peduli/services/service_create_fundraise.dart';
import 'package:image_picker/image_picker.dart';

class ViewModelCreateFundraises with ChangeNotifier {
  ModelCreateFundraise? createFundraise;
  final TextEditingController judul = TextEditingController();
  final TextEditingController deskripsi = TextEditingController();
  final TextEditingController target = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final service = ServiceCreateFundraise();
  DateTime start = DateTime.now();
  DateTime end = DateTime.now().add(const Duration(days: 30));

  File? imageFile;
  String? imagePath;

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      imagePath = pickedImage.path;
    } else {
      print('Tidak ada gambar yang dipilih.');
    }
    notifyListeners();
  }

  Future createFundraising({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      createFundraise = await service.hitCreateFundraise(
        token: accessToken,
        title: judul.text,
        description: deskripsi.text,
        target: int.parse(target.text),
        foto: imageFile!,
        startDate: start,
        endDate: end,
      );
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        createFundraise = await service.hitCreateFundraise(
          token: refreshToken,
          title: judul.text,
          description: deskripsi.text,
          target: int.parse(target.text),
          foto: imageFile!,
          startDate: start,
          endDate: end,
        );

        e.response!.statusCode;
      }
    }
    notifyListeners();
  }
}
