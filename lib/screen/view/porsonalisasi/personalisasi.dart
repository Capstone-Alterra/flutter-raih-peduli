// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/navigation/navigation.dart';
import 'package:flutter_raih_peduli/screen/view/porsonalisasi/personalisasi_content.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:provider/provider.dart';
import '../../view_model/view_model_personalisasi.dart';

class PersonalisasiKonten extends StatelessWidget {
  const PersonalisasiKonten({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<PersonalisasiViewModel>(context, listen: false);
    final sp = Provider.of<SignInViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Rekomendasi Konten',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontFamily: 'Helvetica',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Consumer<PersonalisasiViewModel>(
            builder: (context, viewMode, child) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PersonalisasiContent(
                        title: 'Kesehatan',
                        assetImage: 'assets/kesehatan_personalisasi.png',
                        onPressed: () {
                          viewModel.toggleSelection("Kesehatan");
                        },
                        color: viewModel.isItemSelected('Kesehatan')
                            ? Colors.grey
                            : Colors.white,
                      ),
                      PersonalisasiContent(
                        title: 'Pendidikan',
                        assetImage: 'assets/pendidikan_personalisasi.png',
                        onPressed: () {
                          viewModel.toggleSelection("Pendidikan");
                        },
                        color: viewModel.isItemSelected('Pendidikan')
                            ? Colors.grey
                            : Colors.white,
                      ),
                      PersonalisasiContent(
                        title: 'Teknologi',
                        assetImage: 'assets/technology_personalisasi.png',
                        onPressed: () {
                          viewModel.toggleSelection("Teknologi");
                        },
                        color: viewModel.isItemSelected('Teknologi')
                            ? Colors.grey
                            : Colors.white,
                      ),
                      PersonalisasiContent(
                        title: 'Lingkungan',
                        assetImage: 'assets/lingkungan_personalisasi.png',
                        onPressed: () {
                          viewModel.toggleSelection("Lingkungan");
                        },
                        color: viewModel.isItemSelected('Lingkungan')
                            ? Colors.grey
                            : Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PersonalisasiContent(
                        title: 'Bencana\nAlam',
                        assetImage: 'assets/bencana_personalisasi.png',
                        onPressed: () {
                          viewModel.toggleSelection("Bencana\nAlam");
                        },
                        color: viewModel.isItemSelected('Bencana\nAlam')
                            ? Colors.grey
                            : Colors.white,
                      ),
                      PersonalisasiContent(
                        title: 'Sosial\n',
                        assetImage: 'assets/sosial_personalisasi.png',
                        onPressed: () {
                          viewModel.toggleSelection("Sosial\n");
                        },
                        color: viewModel.isItemSelected('Sosial\n')
                            ? Colors.grey
                            : Colors.white,
                      ),
                      PersonalisasiContent(
                        title: 'Hewan\n',
                        assetImage: 'assets/animal_personalisasi.png',
                        onPressed: () {
                          viewModel.toggleSelection("Hewan\n");
                        },
                        color: viewModel.isItemSelected('Hewan\n')
                            ? Colors.grey
                            : Colors.white,
                      ),
                      PersonalisasiContent(
                        title: 'Panti\nAsuhan',
                        assetImage: 'assets/panti_personalisasi.png',
                        onPressed: () {
                          viewModel.toggleSelection("Panti\nAsuhan");
                        },
                        color: viewModel.isItemSelected("Panti\nAsuhan")
                            ? Colors.grey
                            : Colors.white,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xFF293066),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: () async {
            await viewModel.fetchPersonalisasi(
              accessToken: sp.accessTokenSharedPreference,
              refreshToken: sp.refreshTokenSharedPreference,
            );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomNavgationBar(),
              ),
              (route) => false,
            );
          },
          child: const SizedBox(
            height: 20,
            width: double.infinity,
            child: Center(
              child: Text(
                "Lanjut",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Helvetica"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
