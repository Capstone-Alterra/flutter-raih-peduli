import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/dialog_popup.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/services/service_apply_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:image_picker/image_picker.dart';

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
  final provider = SignInViewModel();

  /*@override
  void dispose() {
    resumeController.dispose();
    reasonController.dispose();
    skillController.dispose();
    super.dispose();
  }*/

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
      print('Tidak ada gambar yang dipilih.');
      return null;
    }
  }

  Future<void> tambahData(BuildContext context, int volunteerId) async {
    // Gantilah sesuai dengan kebutuhan Anda
    final accessTokenSharedPreference = provider.accessTokenSharedPreference;
    final refreshTokenSharedPreference = provider.refreshTokenSharedPreference;

    // Cetak data untuk memeriksa
    print('Volunteer ID: $volunteerId');
    print('Selected Skills: $skillController');
    print('Resume: ${resumeController.text}');
    print('Reason: ${reasonController.text}');
    print('Image Path: $imagePath');
    print('token: $refreshTokenSharedPreference');

    // Validasi data sebelum menambahkannya
    if (selectedSkills.isEmpty ||
        resumeController.text.isEmpty ||
        reasonController.text.isEmpty ||
        imagePath == null) {
      // Tampilkan snackbar jika ada data yang kurang
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Harap isi semua data dengan lengkap.',
            style: TextStyle(color: AppTheme.white),
          ),
          backgroundColor: Colors.red, // Ganti warna sesuai keinginan
        ),
      );
      return;
    }

    // Lakukan sesuatu dengan data yang sudah diisi (misalnya, menyimpan ke database)
    // ...
    if (selectedSkills.isNotEmpty &&
        resumeController.text.isNotEmpty &&
        reasonController.text.isNotEmpty &&
        imagePath != null) {
          
      await service.applyVolunteerWithRefreshToken(
          volunteerId,
          selectedSkills,
          resumeController,
          reasonController,
          imageFile!,
          imagePath!,
          accessTokenSharedPreference,
          refreshTokenSharedPreference);

      showCustomDialog(context, Size.zero);
    }

    // Reset form dan tampilkan snackbar atau navigasi ke halaman lain jika diperlukan
    clearForm();
  }

  // Tambahkan metode untuk mereset form
  void clearForm() {
    selectedSkills.clear();
    resumeController.clear();
    reasonController.clear();
    imagePath = null;
    notifyListeners();
  }
}
