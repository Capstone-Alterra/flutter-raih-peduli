// import 'package:flutter/material.dart';
// import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/text_volunteer.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:path/path.dart';
// import 'package:provider/provider.dart';

// import '../../../../theme.dart';
// import '../../../view_model/view_model_detail_volunteer.dart';
// // import 'skill_chip.dart';

// class TextFormVolunteerBelumNik extends StatefulWidget {
//   const TextFormVolunteerBelumNik({super.key});

//   @override
//   State<TextFormVolunteerBelumNik> createState() =>
//       TextFormVolunteerBelumNikState();
// }

// class TextFormVolunteerBelumNikState extends State<TextFormVolunteerBelumNik> {
// late  DetailVolunteerViewModel viewModel;
//   @override
//   void initState() {

//     viewModel =
//         Provider.of<DetailVolunteerViewModel>(context, listen: false);
//         viewModel.alertKeProfile(MediaQuery.of(context).size, context);
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         textForVolunteer('Skill'),
//         const SizedBox(height: 8),
//         Consumer<DetailVolunteerViewModel>(
//           builder: (context, viewMode, child) {
//             return GestureDetector(
//               onTap: () async {},
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(159, 158, 158, 158),
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(
//                     color: const Color(0xff8CA2CE),
//                   ),
//                 ),
//                 width: size.width,
//                 child: const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Select Skills',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 150, 150, 150),
//                           fontFamily: 'Helvetica',
//                           fontSize: 12,
//                         ),
//                       ),
//                       Icon(Icons.arrow_drop_down),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//         const SizedBox(height: 18),
//         textForVolunteer('Resume'),
//         const SizedBox(height: 8),
//         Consumer<DetailVolunteerViewModel>(
//           builder: (context, viewMode, child) {
//             return Container(
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(159, 158, 158, 158),
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(
//                   color: const Color.fromARGB(159, 158, 158, 158),
//                 ),
//               ),
//               height: size.height * 0.15,
//               child: TextFormField(
//                 enabled: false,
//                 maxLines: 10,
//                 decoration: const InputDecoration(
//                   hintText:
//                       'Ex. Seorang individu yang berkomitmen untuk memberikan dampak positif pada masyarakat dan masa depan generasi penerus.',
//                   hintStyle: TextStyle(
//                     color: Color.fromARGB(255, 150, 150, 150),
//                     fontFamily: 'Helvetica',
//                     fontSize: 12,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.transparent,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.transparent,
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//         const SizedBox(height: 18),
//         textForVolunteer('Alasan Mengikuti'),
//         const SizedBox(height: 8),
//         Consumer<DetailVolunteerViewModel>(
//           builder: (context, viewMode, child) {
//             return Container(
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(159, 158, 158, 158),
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(
//                   color: const Color.fromARGB(159, 158, 158, 158),
//                 ),
//               ),
//               height: size.height * 0.12,
//               child: TextFormField(
//                 enabled: false,
//                 maxLines: 10,
//                 decoration: const InputDecoration(
//                   hintText:
//                       'Ex. Ingin membantu dalam mengajar dan membimbing anak-anak untuk meningkatkan pendidikan mereka.',
//                   hintStyle: TextStyle(
//                     color: Color.fromARGB(255, 150, 150, 150),
//                     fontFamily: 'Helvetica',
//                     fontSize: 12,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.transparent,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.transparent,
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//         const SizedBox(height: 18),
//         textForVolunteer('Foto'),
//         const SizedBox(height: 8),
//         Consumer<DetailVolunteerViewModel>(
//           builder: (context, viewMode, child) {
//             return Container(
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(159, 158, 158, 158),
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(
//                   color: const Color.fromARGB(159, 158, 158, 158),
//                 ),
//               ),
//               height: size.height * 0.07,
//               width: double.infinity,
//               child: Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(
//                   size.width * 0.05,
//                   0,
//                   0,
//                   0,
//                 ),
//                 child: Stack(
//                   alignment: const AlignmentDirectional(-1, 0),
//                   children: [
//                     InkWell(
//                       onTap: () async {},
//                       child: Container(
//                         alignment: Alignment.centerLeft,
//                         width: size.width * 0.38,
//                         height: size.height * 0.05,
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(139, 249, 249, 249),
//                           borderRadius: BorderRadius.circular(5),
//                           border: Border.all(
//                             color: const Color(0xff8CA2CE),
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 12.0),
//                           child: Row(
//                             children: [
//                               SvgPicture.asset(
//                                 'assets/upload_foto.svg',
//                                 height: 24,
//                               ),
//                               const SizedBox(width: 8),
//                               Expanded(
//                                 child: Text(
//                                   viewModel.imagePath != null
//                                       ? basename(viewModel.imagePath!)
//                                       : 'Upload',
//                                   style: const TextStyle(
//                                     color: Color(0xff293066),
//                                     fontFamily: 'Helvetica',
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 1,
//                                 ),
//                               ),
//                               if (viewModel.imagePath != null)
//                                 GestureDetector(
//                                   onTap: () {
//                                     viewModel.imagePath = null;
//                                   },
//                                   child: Container(
//                                     padding: const EdgeInsets.all(8),
//                                     child: const Icon(
//                                       Icons.close,
//                                       color: AppTheme.primaryColor,
//                                     ),
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/text_volunteer.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_detail_volunteer.dart';
import 'package:flutter_raih_peduli/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TextFormVolunteerBelumNik extends StatefulWidget {
  const TextFormVolunteerBelumNik({super.key});

  @override
  State<TextFormVolunteerBelumNik> createState() =>
      _TextFormVolunteerBelumNikState();
}

class _TextFormVolunteerBelumNikState extends State<TextFormVolunteerBelumNik> {
  late DetailVolunteerViewModel viewModel;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      viewModel = Provider.of<DetailVolunteerViewModel>(context, listen: false);
      viewModel.alertKeProfile(MediaQuery.of(context).size, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textForVolunteer('Skill'),
        const SizedBox(height: 8),
        Consumer<DetailVolunteerViewModel>(
          builder: (context, viewMode, child) {
            return GestureDetector(
              onTap: () async {},
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(159, 158, 158, 158),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xff8CA2CE),
                  ),
                ),
                width: size.width,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Skills',
                        style: TextStyle(
                          color: Color.fromARGB(255, 150, 150, 150),
                          fontFamily: 'Helvetica',
                          fontSize: 12,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
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
                color: const Color.fromARGB(159, 158, 158, 158),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color.fromARGB(159, 158, 158, 158),
                ),
              ),
              height: size.height * 0.15,
              child: TextFormField(
                enabled: false,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText:
                      'Ex. Seorang individu yang berkomitmen untuk memberikan dampak positif pada masyarakat dan masa depan generasi penerus.',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 150, 150, 150),
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
                color: const Color.fromARGB(159, 158, 158, 158),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color.fromARGB(159, 158, 158, 158),
                ),
              ),
              height: size.height * 0.12,
              child: TextFormField(
                enabled: false,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText:
                      'Ex. Ingin membantu dalam mengajar dan membimbing anak-anak untuk meningkatkan pendidikan mereka.',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 150, 150, 150),
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
            return Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(159, 158, 158, 158),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color.fromARGB(159, 158, 158, 158),
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
                      onTap: () async {},
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: size.width * 0.38,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(139, 249, 249, 249),
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
                              const Expanded(
                                child: Text(
                                  'Upload',
                                  style: TextStyle(
                                    color: Color(0xff293066),
                                    fontFamily: 'Helvetica',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
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
