import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_create_fundraise.dart';
import 'package:flutter_raih_peduli/services/service_create_fundraise.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ViewModelCreateFundraises with ChangeNotifier {
  ModelCreateFundraise? createFundraise;
  final TextEditingController judul = TextEditingController();
  final TextEditingController deskripsi = TextEditingController();
  final TextEditingController target = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final service = ServiceCreateFundraise();
  DateTime start = DateTime.now();
  DateTime end = DateTime.now().add(const Duration(days: 30));
  bool isSukses = false;
  bool fotoLebihLimaMB = false;
  File? imageFile;
  String? imagePath;

  Future<void> selectStartDate(BuildContext context) async {
    final pickedStartDate = await showDatePicker(
      context: context,
      initialDate: start,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedStartDate != null && pickedStartDate != start) {
      start = pickedStartDate;
      notifyListeners();
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    final pickedEndDate = await showDatePicker(
      context: context,
      initialDate: end,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedEndDate != null && pickedEndDate != end) {
      end = start.add(
        const Duration(days: 1),
      );
      notifyListeners();
    }
  }

  Future createFundraising({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      isSukses = false;
      createFundraise = await service.hitCreateFundraise(
        token: accessToken,
        title: judul.text,
        description: deskripsi.text,
        target: int.parse(target.text),
        foto: imageFile!,
        startDate: start,
        endDate: end,
      );
      isSukses = true;
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        isSukses = false;
        createFundraise = await service.hitCreateFundraise(
          token: refreshToken,
          title: judul.text,
          description: deskripsi.text,
          target: int.parse(target.text),
          foto: imageFile!,
          startDate: start,
          endDate: end,
        );
        isSukses = true;
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }

  void clearAll() {
    judul.clear();
    deskripsi.clear();
    target.clear();
    imageFile = null;
    imagePath = null;
  }

  String? validateJudul(String value) {
    if (value.isEmpty) {
      return 'Judul tidak boleh kosong';
    } else if (value.length < 20) {
      return 'Judul minimal 20 huruf';
    }
    notifyListeners();
    return null;
  }

  String? validateDeskripsi(String value) {
    if (value.isEmpty) {
      return 'Deskripsi tidak boleh kosong';
    } else if (value.length < 50) {
      return 'Deskripsi minimal 50 huruf';
    }
    notifyListeners();
    return null;
  }

  String? validateTarget(String value) {
    if (value.isEmpty) {
      return 'Target tidak boleh kosong';
    } else {
      try {
        final targetValue = int.parse(value);
        if (targetValue < 20000) {
          return 'Target minimal Rp. 100.000';
        }
      } catch (e) {
        return 'Masukkan angka yang valid';
      }
    }
    notifyListeners();
    return null;
  }

  TextEditingValue formatTarget(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final numericValue = int.tryParse(newValue.text.replaceAll(',', ''));

    if (numericValue != null) {
      final formattedValue =
          NumberFormat('#,##0', 'en_US').format(numericValue);
      return newValue.copyWith(
        text: formattedValue,
        selection: TextSelection.collapsed(offset: formattedValue.length),
      );
    }

    return newValue;
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final File newImageFile = File(pickedImage.path);
      final int fileSizeInBytes = await newImageFile.length();
      const int maxSizeInBytes = 5 * 1024 * 1024;

      if (fileSizeInBytes > maxSizeInBytes) {
        fotoLebihLimaMB = true;
        debugPrint('File lebih dari 5MB. Pilih gambar yang lebih kecil.');
      } else {
        fotoLebihLimaMB = false;
        imageFile = newImageFile;
        imagePath = pickedImage.path;
      }
    } else {
      imageFile = File('');
      imagePath = null;
      fotoLebihLimaMB = false;
      debugPrint('Tidak ada gambar yang dipilih.');
    }
    notifyListeners();
  }

  Future<void> pickImageKamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      final File newImageFile = File(pickedImage.path);
      final int fileSizeInBytes = await newImageFile.length();
      const int maxSizeInBytes = 5 * 1024 * 1024;

      if (fileSizeInBytes > maxSizeInBytes) {
        fotoLebihLimaMB = true;
        debugPrint('File lebih dari 5MB. Pilih gambar yang lebih kecil.');
      } else {
        fotoLebihLimaMB = false;
        imageFile = newImageFile;
        imagePath = pickedImage.path;
      }
    } else {
      imageFile = File('');
      imagePath = null;
      fotoLebihLimaMB = false;
      debugPrint('Tidak ada gambar yang dipilih.');
    }
    notifyListeners();
  }
}
