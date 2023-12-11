// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_create_fundraise.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';
import '../widgets/volunteer/text_volunteer.dart';

class FormCreateFundraise extends StatelessWidget {
  const FormCreateFundraise({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<ViewModelCreateFundraises>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Consumer<ViewModelCreateFundraises>(
          builder: (context, viewMode, child) {
            return Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textForVolunteer('Judul Penggalangan Dana'),
                  TextFormField(
                    controller: viewModel.judul,
                    decoration: InputDecoration(
                      hintText:
                          'Ex. Seorang individu yang berkomitmen untuk memberikan dampak positif pada masyarakat dan masa depan generasi penerus.',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 112, 112, 112),
                        fontFamily: 'Helvetica',
                        fontSize: 12,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(
                          79, 140, 162, 206), // Warna latar belakang
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none, // Agar tidak ada border
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none, // Agar tidak ada border
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  textForVolunteer('Isi Deskripsi'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: viewModel.deskripsi,
                    decoration: InputDecoration(
                      hintText:
                          'Ex. Seorang individu yang berkomitmen untuk memberikan dampak positif pada masyarakat dan masa depan generasi penerus.',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 112, 112, 112),
                        fontFamily: 'Helvetica',
                        fontSize: 12,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(
                          79, 140, 162, 206), // Warna latar belakang
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none, // Agar tidak ada border
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none, // Agar tidak ada border
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  textForVolunteer('Target'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: viewModel.target,
                    decoration: InputDecoration(
                      hintText:
                          'Ex. Seorang individu yang berkomitmen untuk memberikan dampak positif pada masyarakat dan masa depan generasi penerus.',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 112, 112, 112),
                        fontFamily: 'Helvetica',
                        fontSize: 12,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(
                          79, 140, 162, 206), // Warna latar belakang
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none, // Agar tidak ada border
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none, // Agar tidak ada border
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Tanggal Mulai"),
                          GestureDetector(
                            child: Container(
                              width: size.width / 3,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8.0,
                                  ),
                                ),
                              ),
                              child: Text("text"),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text("Tanggal Selesai"),
                          GestureDetector(
                            child: Container(
                              width: size.width / 3,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8.0,
                                  ),
                                ),
                              ),
                              child: Text("text"),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 18),
        textForVolunteer('Unggah Gambar Penggalangan Dana'),
        const SizedBox(height: 8),
        Consumer<ViewModelCreateFundraises>(
          builder: (context, viewMode, child) {
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xff8CA2CE).withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xff8CA2CE),
                ),
              ),
              height: size.height * 0.07,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  size.width * 0.05,
                  0,
                  0,
                  0,
                ),
                child: Stack(
                  alignment: const AlignmentDirectional(-1, 0),
                  children: [
                    InkWell(
                      onTap: () async {
                        viewModel.pickImage();
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: size.width * 0.38,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xff8CA2CE),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/upload_foto.svg',
                                height: 24,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  viewModel.imagePath ?? 'Upload',
                                  style: const TextStyle(
                                    color: Color(0xff293066),
                                    fontFamily: 'Helvetica',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              if (viewModel.imagePath != null)
                                GestureDetector(
                                  onTap: () {
                                    viewModel.imagePath = null;
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(
                                      Icons.close,
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
