// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_profile.dart';
import 'package:flutter_raih_peduli/services/service_edit_profile.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  ModelProfile? modelProfile;
  final service = ProfileService();
  bool isLoading = false;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  bool isCheckNik = true;
  bool isEdit = false;
  File? imageFile;
  String? imagePath;

  Future fetchProfile({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      isLoading = true;
      modelProfile = await service.hitProfile(token: accessToken);
      isLoading = false;
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        isLoading = true;
        modelProfile = await service.hitProfile(token: refreshToken);
        isLoading = false;
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }

  Future fetchProfileTanpaLoading({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      modelProfile = await service.hitProfile(token: accessToken);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        modelProfile = await service.hitProfile(token: refreshToken);
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }

  Future fetchNik({
    required String accessToken,
    required String refreshToken,
    required String email,
  }) async {
    String fullName = fullNameController.text.isEmpty
        ? modelProfile!.data.fullname
        : fullNameController.text;
    String phone = telpController.text.isEmpty
        ? modelProfile!.data.phoneNumber
        : telpController.text;
    String alamat = alamatController.text.isEmpty
        ? modelProfile!.data.address
        : alamatController.text;
    String nik = nikController.text.isEmpty
        ? modelProfile!.data.nik
        : nikController.text;
    try {
      await service.hitUpdateProfile(
        token: accessToken,
        fullname: fullName,
        email: email,
        nik: nik,
        phone: phone,
        address: alamat,
        foto: imageFile!,
      );
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        await service.hitUpdateProfile(
          token: refreshToken,
          fullname: fullName,
          email: email,
          nik: nik,
          phone: phone,
          address: alamat,
          foto: imageFile!,
        );
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }

  void setSudahLogin() {
    if (modelProfile!.data.nik == '') {
      isCheckNik = false;
    } else {
      isCheckNik = true;
    }
  }

  void enable() {
    isEdit = !isEdit;
    notifyListeners();
  }

  void awal() {
    isEdit = false;
    notifyListeners();
  }

  void clearAll() {
    fullNameController.clear();
    emailController.clear();
    telpController.clear();
    alamatController.clear();
    nikController.clear();
    imageFile = null;
    imagePath = null;
  }

  String? validateNik(String value) {
    if (value.isNotEmpty && value.length != 16) {
      return 'Jumlah NIK wajib 16 digit';
    }
    return null;
  }

  String? validateNomor(String value) {
    if (value.isNotEmpty && value.length < 10) {
      return 'Jumlah Nomor minimal 10 digit';
    } else if (value.length > 13) {
      return 'Nomor maksimal 13 digit';
    }
    return null;
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // Mendapatkan ukuran file gambar
      final File imageFile = File(pickedImage.path);
      final int fileSizeInBytes = await imageFile.length();

      // Mengatur batas ukuran file (dalam bytes)
      final int maxSizeInBytes = 5 * 1024 * 1024; // 5 MB

      if (fileSizeInBytes > maxSizeInBytes) {
        // Menampilkan pesan jika ukuran file lebih dari 5MB
        debugPrint('File lebih dari 5MB. Pilih gambar yang lebih kecil.');
      } else {
        // Menyimpan informasi gambar jika ukuran file sesuai
        this.imageFile = imageFile;
        this.imagePath = pickedImage.path;
      }
    } else {
      debugPrint('Tidak ada gambar yang dipilih.');
    }

    notifyListeners();
  }
}
