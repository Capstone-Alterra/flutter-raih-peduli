// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_create_fundraise.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../theme.dart';
import '../widgets/volunteer/text_volunteer.dart';
import 'text_field_create_fundraise.dart';

class FormCreateFundraise extends StatefulWidget {
  const FormCreateFundraise({super.key});

  @override
  State<FormCreateFundraise> createState() => _FormCreateFundraiseState();
}

class _FormCreateFundraiseState extends State<FormCreateFundraise> {
  late ViewModelCreateFundraises viewModel;
  @override
  void initState() {
    viewModel = Provider.of<ViewModelCreateFundraises>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat("dd-MM-yyyy");
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
                  textFormFieldCreateFundraises(
                    controller: viewModel.judul,
                    validator: (value) => viewModel.validateJudul(value!),
                    labelText:
                        "Ex. Bantu Anak-Anak Sekolah Mewujudkan Masa Depan Cerah",
                  ),
                  const SizedBox(height: 18),
                  textForVolunteer('Isi Deskripsi'),
                  textFormFieldCreateFundraises(
                    controller: viewModel.deskripsi,
                    validator: (value) => viewModel.validateDeskripsi(value!),
                    labelText:
                        "Ex. Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan.",
                    maxLine: 5,
                  ),
                  const SizedBox(height: 18),
                  textForVolunteer('Target'),
                  textFormFieldCreateFundraises(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.phone,
                    controller: viewModel.target,
                    validator: (value) => viewModel.validateTarget(value!),
                    labelText: "Ex.50.000.000",
                    prefixIcon: Text(
                      'Rp ',
                      style: TextStyle(
                        fontSize: size.width / 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " Tanggal Mulai",
                            style: TextStyle(
                                color: const Color(0xff293066),
                                fontFamily: 'Helvetica',
                                fontSize: size.width / 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: size.width / 70),
                          GestureDetector(
                            onTap: () {
                              viewModel.selectStartDate(context);
                            },
                            child: Container(
                              width: size.width / 2.25,
                              height: size.width / 9,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(
                                  79,
                                  140,
                                  162,
                                  206,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(7.0),
                                ),
                                border: Border.all(
                                  color: const Color(0xFF293066),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          formatter.format(viewModel.start),
                                          style: TextStyle(
                                            fontSize: size.width / 27.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.calendar_month,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Selesai",
                            style: TextStyle(
                                color: const Color(0xff293066),
                                fontFamily: 'Helvetica',
                                fontSize: size.width / 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: size.width / 70),
                          GestureDetector(
                            onTap: () {
                              viewModel.selectEndDate(context);
                            },
                            child: Container(
                              width: size.width / 2.25,
                              height: size.width / 9,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(
                                  79,
                                  140,
                                  162,
                                  206,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(7.0),
                                ),
                                border: Border.all(
                                  color: const Color(0xFF293066),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          formatter.format(viewModel.end),
                                          style: TextStyle(
                                            fontSize: size.width / 27.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.calendar_month,
                                    size: 24.0,
                                  ),
                                ],
                              ),
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                            showImagePickerOption(context);
                            // viewModel.pickImage();
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
                ),
                if (viewModel.fotoLebihLimaMB == true)
                  Text(
                    'File lebih dari 5MB',
                    style: TextStyle(
                      fontSize: size.height / 60,
                      color: Colors.red,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  void showImagePickerOption(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      )),
      backgroundColor: Colors.white,
      context: context,
      builder: (builder) {
        return SizedBox(
          width: size.width * 0.9,
          height: size.height * 0.26,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              size.width * 0.05,
              size.height * 0.001,
              size.width * 0.05,
              size.height * 0.01,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ubah Foto Profil',
                      style: TextStyle(
                          color: Color(0xff293066),
                          fontFamily: 'Helvetica',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: size.width * 0.07,
                      height: size.height * 0.07,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff293066),
                      ),
                      child: IconButton(
                          splashRadius: 1,
                          alignment: Alignment.center,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 14.35,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            viewModel.pickImageKamera();
                          },
                          child: Container(
                            width: size.width * 0.2,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xff293066),
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Color(0xff293066),
                              size: 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01),
                          child: const Text(
                            'Kamera',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 20,
                              color: Color(0xff293066),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            viewModel.pickImage();
                          },
                          child: Container(
                            width: size.width * 0.2,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xff293066),
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.image,
                              color: Color(0xff293066),
                              size: 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01),
                          child: const Text(
                            'Galeri',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 20,
                              color: Color(0xff293066),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
