import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/text_volunteer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../../../../theme.dart';
import '../../../view_model/view_model_detail_volunteer.dart';
import 'skill_filter.dart';

class TextFormVolunteer extends StatefulWidget {
  const TextFormVolunteer({Key? key});

  @override
  State<TextFormVolunteer> createState() => TextFormVolunteerState();
}

class TextFormVolunteerState extends State<TextFormVolunteer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<DetailVolunteerViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textForVolunteer('Skill'),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () async {
                final selectedSkillResult = await showSkillFilter(context);
                if (selectedSkillResult != null) {
                  final skills = selectedSkillResult
                      .split(',')
                      .map((e) => e.trim())
                      .toList();

                  for (var skill in skills) {
                    viewModel.addSkill(skill);
                  }

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
                      Expanded(
                        child: Wrap(
                          spacing: 6.0,
                          runSpacing: 4.0,
                          children: viewModel.selectedSkills.map((skill) {
                            return Chip(
                              label: Text(
                                skill,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              deleteIcon: const Icon(
                                Icons.close,
                                color: AppTheme.white,
                                size: 16,
                              ),
                              onDeleted: () {
                                viewModel.removeSkill(skill);
                              },
                              backgroundColor: AppTheme.primaryColor,
                              labelStyle: const TextStyle(
                                color: AppTheme.white,
                                fontFamily: 'Helvetica',
                                fontSize: 12,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            textForVolunteer('Resume'),
            const SizedBox(height: 8),
            Container(
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
            ),
            const SizedBox(height: 18),
            textForVolunteer('Alasan Mengikuti'),
            const SizedBox(height: 8),
            Container(
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
            ),
            const SizedBox(height: 18),
            textForVolunteer('Foto'),
            const SizedBox(height: 8),
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
                        final imageData = await viewModel.pickImage();
                        if (imageData != null) {
                          viewModel.imagePath = imageData.path;
                          viewModel.imageFile = imageData.file;
                        }
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
                                  viewModel.imagePath != null
                                      ? basename(viewModel.imagePath!)
                                      : 'Upload',
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
                                    viewModel.removeImagePath();
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
          ],
        );
      },
    );
  }
}
