import 'package:dio/dio.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_detail_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/utils/utils.dart';

class ApplyVolunteerService {
  final Dio dio = Dio();

  Future<void> applyVolunteerWithRefreshToken(
    DetailVolunteerViewModel viewModel,
    SignInViewModel provider, 
    String refreshToken, // Tambahkan parameter volunteerId
  ) async {
    try {
      // Konstruksi form data
      FormData formData = FormData.fromMap({
        'vacancy_id' : viewModel.volunteerId, // Gunakan volunteerId sebagai vacancy_id
        'skills': viewModel.selectedSkills.join(','),
        'resume': viewModel.resumeController.text,
        'reason': viewModel.reasonController.text,
        'image': await MultipartFile.fromFile(viewModel.imagePath!),
      });

      final refreshToken = provider.refreshTokenSharedPreference;

      // Konstruksi header dengan refreshToken sebagai bearer token
      Options options = Options(
        headers: {
          'Authorization': refreshToken,
          'Content-Type': 'multipart/form-data',
        },
      );

      // Kirim permintaan POST
      Response response = await dio.post(
        Urls.baseUrl + Urls.applyVolunteer,
        data: formData,
        options: options,
      );

      // Cek status response
      if (response.statusCode == 200) {
        // Volunteer berhasil mendaftar
        print('Volunteer berhasil mendaftar.');
      } else {
        // Ada kesalahan dalam permintaan
        print('Gagal mendaftar sebagai Volunteer. Status: ${response.statusCode}');
      }
    } catch (error) {
      // Tangani kesalahan
      print('Terjadi kesalahan: $error');
    }
  }
}
