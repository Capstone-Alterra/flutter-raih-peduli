import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/settings/edit_profile.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/snackbar.dart';
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

  /*final TextEditingController nikTextController = TextEditingController();
  bool isNikEmpty() {
    return nikTextController.text.trim().isEmpty;
  }

  Future<void> checkNik(BuildContext context) async {
    if (isNikEmpty()) {
      // Lakukan navigasi atau tindakan lain jika NIK terisi
       Size size = MediaQuery.of(context).size;
      final snackBar = snackBarVolunteer(size, context);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileEdit()),
        );
      });
    } else {}
  }*/

  void setVolunteerId(int id) {
    volunteerId = id;
    notifyListeners();
  }

  void addSkill(String skill) {
    // Pastikan skill belum ada dalam daftar selectedSkills
    if (!selectedSkills.contains(skill)) {
      selectedSkills.add(skill);
      notifyListeners();
    }
  }

  void removeSkill(String skill) {
    selectedSkills.remove(skill);
    notifyListeners();
  }

  void clearSelectedSkills() {
    selectedSkills.clear();
    notifyListeners();
  }

  void removeImagePath() {
    imagePath = null;
    notifyListeners();
  }

  Future<ImageData?> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // Mengembalikan ImageData yang berisi path dan file
      notifyListeners();
      return ImageData(pickedImage.path, File(pickedImage.path));
    } else {
      // Tampilkan pesan kesalahan jika tidak ada gambar yang dipilih
      print('Tidak ada gambar yang dipilih.');
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
    selectedSkills.clear();
    resumeController.clear();
    reasonController.clear();
    imageFile = null;
    imagePath = null;
    notifyListeners();
  }
}
