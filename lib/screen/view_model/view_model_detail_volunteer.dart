import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/service_apply_volunteer.dart';

class ImageData {
  final String path;
  final File file;

  ImageData(this.path, this.file);
}

class DetailVolunteerViewModel with ChangeNotifier {
  List<String> selectedSkills = [];
  TextEditingController resumeController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  File? imageFile;
  String? imagePath;
  int? volunteerId;

  final service = ApplyVolunteerService();

  void setVolunteerId(int id) {
    volunteerId = id;
    notifyListeners();
  }

  void addSkill(String skill) {
    selectedSkills.add(skill);
    notifyListeners();
  }

  void removeSkill(String skill) {
    selectedSkills.remove(skill);
    notifyListeners();
  }

  void clearSelectedSkills() {
    selectedSkills.clear();
    notifyListeners();
  }

  Future<ImageData?> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // Mengembalikan ImageData yang berisi path dan file
      return ImageData(pickedImage.path, File(pickedImage.path));
    } else {
      // Tampilkan pesan kesalahan jika tidak ada gambar yang dipilih
      debugPrint('Tidak ada gambar yang dipilih.');
      return null;
    }
  }

  Future fetchApplyVolunteer({
    required String accessToken,
    required String refreshToken,
    required int volunteerId,
    // required File foto,
  }) async {
    try {
      await service.hitApplyVolunteer(
        token: accessToken,
        id: volunteerId,
        skills: skillController.text,
        resume: resumeController.text,
        reason: reasonController.text,
        foto: imageFile!,
      );
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        await service.hitApplyVolunteer(
          token: refreshToken,
          id: volunteerId,
          skills: skillController.text,
          resume: resumeController.text,
          reason: reasonController.text,
          foto: imageFile!,
        );

        e.response!.statusCode;
      }
    }
    notifyListeners();
  }

  void clearAll() {
    skillController.clear();
    resumeController.clear();
    reasonController.clear();
    imageFile = null;
    imagePath = null;
  }
}
