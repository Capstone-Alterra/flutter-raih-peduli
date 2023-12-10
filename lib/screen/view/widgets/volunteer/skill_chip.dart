// // ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:flutter_raih_peduli/screen/view_model/view_model_detail_volunteer.dart';
// import 'package:provider/provider.dart';

// import '../../../../theme.dart';

// class SkillChip extends StatelessWidget {
//   String skill;
//   SkillChip({required this.skill, super.key});

//   @override
//   Widget build(BuildContext context) {
//     final viewModel =
//         Provider.of<DetailVolunteerViewModel>(context, listen: false);
//     return Consumer<DetailVolunteerViewModel>(
//       builder: (context, viewMode, child) {
//         return Chip(
//           label: Text(
//             skill,
//             style: const TextStyle(
//                 fontSize: 10, // Sesuaikan ukuran font sesuai kebutuhan
//                 fontWeight: FontWeight.bold),
//           ),
//           deleteIcon: const Icon(
//             Icons.close,
//             color: AppTheme.white,
//             size: 16, // Sesuaikan ukuran ikon delete sesuai kebutuhan
//           ),
//           onDeleted: () {
//             viewModel.selectedSkills.remove(skill);
//           },
//           backgroundColor: AppTheme.primaryColor,
//           labelStyle: const TextStyle(
//             color: AppTheme.white,
//             fontFamily: 'Helvetica',
//             fontSize: 12,
//           ),
//         );
//       },
//     );
//   }
// }
