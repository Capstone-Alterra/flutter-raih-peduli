// // ignore_for_file: use_key_in_widget_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/relawan_card_widget.dart';
// import 'package:flutter_raih_peduli/screen/view_model/view_model_volunteer.dart';
// import 'package:provider/provider.dart';

// class RelawanListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
    
//   final viewModel = Provider.of<VolunteerViewModel>(context, listen: false);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.only(left: 8, top: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           ),
//         ),
//         SizedBox(
//           height: 600,
//           child: ListView.builder(
//             scrollDirection: Axis.vertical,
//             itemCount: viewModel.modelVolunteer!.data.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(0),
//                 child: SizedBox(
//                   child: RelawanCard(
//                     volunteerData: viewModel.modelVolunteer!.data[index],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
