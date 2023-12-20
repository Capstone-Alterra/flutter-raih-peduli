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
  File? imageFile = File('');
  String? imagePath;
  bool fotoLebihLimaMB = false;

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
        foto: imageFile,
        photo: modelProfile!.data.profilePicture,
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
          foto: imageFile,
          photo: modelProfile!.data.profilePicture,
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
  }

  void clearAll() {
    fullNameController.clear();
    emailController.clear();
    telpController.clear();
    alamatController.clear();
    nikController.clear();
    imageFile = null;
    imagePath = null;
    fotoLebihLimaMB = false;
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
      final File newImageFile = File(pickedImage.path);
      final int fileSizeInBytes = await newImageFile.length();
      const int maxSizeInBytes = 5 * 1024 * 1024;

      if (fileSizeInBytes > maxSizeInBytes) {
        fotoLebihLimaMB = true;
      } else {
        fotoLebihLimaMB = false;
        imageFile = newImageFile;
        imagePath = pickedImage.path;
      }
    } else {
      imageFile = File('');
      imagePath = null;
      fotoLebihLimaMB = false;
    }
    notifyListeners();
  }

    Future<void> pickImageKamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      final File newImageFile = File(pickedImage.path);
      final int fileSizeInBytes = await newImageFile.length();
      const int maxSizeInBytes = 5 * 1024 * 1024;

      if (fileSizeInBytes > maxSizeInBytes) {
        fotoLebihLimaMB = true;
      } else {
        fotoLebihLimaMB = false;
        imageFile = newImageFile;
        imagePath = pickedImage.path;
      }
    } else {
      imageFile = File('');
      imagePath = null;
      fotoLebihLimaMB = false;
    }
    notifyListeners();
  }

  
}
