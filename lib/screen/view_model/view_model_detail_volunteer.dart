import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/model/model_skill.dart';
import 'package:flutter_raih_peduli/services/service_list_skill.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/service_apply_volunteer.dart';
import '../view/settings/edit_profile.dart';
import '../view/widgets/volunteer/snackbar.dart';

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
  bool fotoLebihLimaMB = false;

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
    selectedSkills.clear();
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
      listSKill = await getSkill.hitSkill(
        token: accessToken,
      );

      isSukses = true;
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        isSukses = false;
        listSKill = await getSkill.hitSkill(
          token: refreshToken,
        );
        isSukses = true;

        e.response!.statusCode;
      }
    }
    notifyListeners();
  }
// }

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
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

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

  void hapusFoto() {
    imagePath = null;
    notifyListeners();
  }
}
