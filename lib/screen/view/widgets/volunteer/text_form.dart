import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_detail_volunteer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../theme.dart';
import 'skill_filter.dart';
import 'text_volunteer.dart';

class TextFormVolunteer extends StatefulWidget {
  const TextFormVolunteer({Key? key}) : super(key: key);

  @override
  State<TextFormVolunteer> createState() => _TextFormVolunteerState();
}

class _TextFormVolunteerState extends State<TextFormVolunteer> {
  late DetailVolunteerViewModel viewModel;
  @override
  void initState() {
    viewModel = Provider.of<DetailVolunteerViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textForVolunteer('Skill'),
          const SizedBox(height: 8),
          Consumer<DetailVolunteerViewModel>(
            builder: (context, viewMode, child) {
              return GestureDetector(
                onTap: () async {
                  final selectedSkillResult = await showSkillFilter(context);
                  if (selectedSkillResult != null) {
                    viewModel.selectedSkills = selectedSkillResult
                        .split(',')
                        .map((e) => e.trim())
                        .toList();
                    viewModel.skillController.text =
                        viewModel.selectedSkills.join(', ');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff8CA2CE).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xff8CA2CE),
                    ),
                  ),
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<DetailVolunteerViewModel>(
                          builder: (context, contactModel, child) {
                            return ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: size.width / 1.3,
                              ),
                              child: viewModel.selectedSkills.isEmpty
                                  ? const Text(
                                      'Select Skills',
                                      style: TextStyle(
                                        color: Color(0xffB0B0B0),
                                        fontFamily: 'Helvetica',
                                        fontSize: 12,
                                      ),
                                    )
                                  : Wrap(
                                      spacing: 6.0,
                                      runSpacing: 4.0,
                                      children: viewModel.selectedSkills.map(
                                        (skill) {
                                          return Chip(
                                            label: Text(
                                              skill,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            backgroundColor:
                                                AppTheme.primaryColor,
                                            labelStyle: const TextStyle(
                                              color: AppTheme.white,
                                              fontFamily: 'Helvetica',
                                              fontSize: 12,
                                            ),
                                          );
                                        },
                                      ).toList(),
                                    ),
                            );
                          },
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 18),
          textForVolunteer('Resume'),
          const SizedBox(height: 8),
          Consumer<DetailVolunteerViewModel>(
            builder: (context, viewMode, child) {
              return Container(
                decoration: BoxDecoration(
                  color: const Color(0xff8CA2CE).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xff8CA2CE),
                  ),
                ),
                height: size.height * 0.15,
                child: TextFormField(
                  controller: viewModel.resumeController,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText:
                        'Ex. Seorang individu yang berkomitmen untuk memberikan dampak positif pada masyarakat dan masa depan generasi penerus.',
                    hintStyle: TextStyle(
                      color: Color(0xffB0B0B0),
                      fontFamily: 'Helvetica',
                      fontSize: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 18),
          textForVolunteer('Alasan Mengikuti'),
          const SizedBox(height: 8),
          Consumer<DetailVolunteerViewModel>(
            builder: (context, viewMode, child) {
              return Container(
                decoration: BoxDecoration(
                  color: const Color(0xff8CA2CE).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xff8CA2CE),
                  ),
                ),
                height: size.height * 0.12,
                child: TextFormField(
                  controller: viewModel.reasonController,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText:
                        'Ex. Ingin membantu dalam mengajar dan membimbing anak-anak untuk meningkatkan pendidikan mereka.',
                    hintStyle: TextStyle(
                      color: Color(0xffB0B0B0),
                      fontFamily: 'Helvetica',
                      fontSize: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 18),
          textForVolunteer('Foto'),
          const SizedBox(height: 8),
          Consumer<DetailVolunteerViewModel>(
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
      ),
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
