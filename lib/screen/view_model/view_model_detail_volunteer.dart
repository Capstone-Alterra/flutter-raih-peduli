import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_skill.dart';
import 'package:flutter_raih_peduli/services/service_list_skill.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/service_apply_volunteer.dart';
import '../view/settings/edit_profile.dart';
import '../view/widgets/volunteer/snackbar.dart';

// class ImageData {
//   final String path;
//   final File file;

//   ImageData(this.path, this.file);
// }

class DetailVolunteerViewModel with ChangeNotifier {
  List<String> selectedSkills = [];
  ListSkill? listSKill;
  TextEditingController resumeController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  File? imageFile;
  String? imagePath;
  int? volunteerId;
  bool isSukses = true;

  final service = ApplyVolunteerService();
  final getSkill = ListSKillService();

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

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      imagePath = pickedImage.path;
    } else {
      debugPrint('Tidak ada gambar yang dipilih.');
    }
    notifyListeners();
  }

  Future fetchApplyVolunteer({
    required String accessToken,
    required String refreshToken,
    required int volunteerId,
    required String nik,
  }) async {
    try {
      isSukses = false;
      await service.hitApplyVolunteer(
        token: accessToken,
        id: volunteerId,
        skills: skillController.text,
        resume: resumeController.text,
        reason: reasonController.text,
        foto: imageFile!,
        nik: nik,
      );
      isSukses = true;
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        isSukses = false;
        await service.hitApplyVolunteer(
          token: refreshToken,
          id: volunteerId,
          skills: skillController.text,
          resume: resumeController.text,
          reason: reasonController.text,
          foto: imageFile!,
          nik: nik,
        );
        isSukses = true;
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

  void alertKeProfile(size, context) async {
    final snackBar = snackBarVolunteer(size, context);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    await Future.delayed(const Duration(seconds: 4), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ProfileEdit()),
    );
  }
  
  Future fetchSkill({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      isSukses = false;
      final data = await getSkill.hitSkill(
        token: accessToken,
      );
      listSKill = data.take(10).toList();
      isSukses = true;
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        isSukses = false;
        final data =await getSkill.hitSkill(
          token: refreshToken,
        );
        listSKill = data.take(10).toList();
        isSukses = true;
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }
}
