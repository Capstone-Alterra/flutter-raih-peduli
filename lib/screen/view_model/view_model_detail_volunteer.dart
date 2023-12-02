import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/dialog_popup.dart';
import 'package:image_picker/image_picker.dart';

class DetailVolunteerViewModel extends ChangeNotifier {
  final Set<String> _selectedSkills = <String>{};
  Set<String> get selectedSkills => _selectedSkills;

  TextEditingController resumeController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  String? imagePath;

  @override
  void dispose() {
    resumeController.dispose();
    reasonController.dispose();
    skillController.dispose();
    super.dispose();
  }

  void addSkill(String skill) {
    _selectedSkills.add(skill);
    notifyListeners();
  }

  void removeSkill(String skill) {
    _selectedSkills.remove(skill);
    notifyListeners();
  }

  void clearSelectedSkills() {
    _selectedSkills.clear();
    notifyListeners();
  }

  Future<String?> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // Disini, kamu dapat meng-handle path gambar yang dipilih sesuai kebutuhanmu
      // Misalnya, menyimpan path gambar ke property di ViewModel atau mengembalikannya sebagai String
      return pickedImage.path;
    }

    return null; // Return null jika tidak ada gambar yang dipilih
  }

  Future<void> tambahData(BuildContext context) async {
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
            style: TextStyle(color: Color(0xffFFAF0F)),
          ),
          backgroundColor: Color(0xffFFCC1B), // Ganti warna sesuai keinginan
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
