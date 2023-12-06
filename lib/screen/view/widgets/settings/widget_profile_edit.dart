// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:flutter_raih_peduli/model/model_profile.dart';
// import 'package:flutter_raih_peduli/screen/view/widgets/settings/textFieldSetting.dart';
// import 'package:provider/provider.dart';

// import '../../../view_model/view_model_profile.dart';

// class EditTextField extends StatefulWidget {
//   final Data profileData;

//   const EditTextField({
//     required this.profileData,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
// return
//   }
//   // @override
//   // State<EditTextField> createState() => EditTextFieldState();
// }

// class EditTextFieldState extends State<EditTextField> {
//   late ProfileViewModel viewModel;
//   @override
//   void initState() {
//     viewModel = Provider.of<ProfileViewModel>(context, listen: false);
//     super.initState();
//   }

// }
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/settings/textFieldSetting.dart';
import 'package:provider/provider.dart';

import '../../../../model/model_profile.dart';
import '../../../view_model/view_model_profile.dart';

class EditTextField extends StatefulWidget {
  final Data profileData;
  const EditTextField({super.key, required this.profileData});

  @override
  State<EditTextField> createState() => _EditTextFieldState();
}

class _EditTextFieldState extends State<EditTextField> {
  late ProfileViewModel viewModel;
  @override
  void initState() {
    viewModel = Provider.of<ProfileViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ProfileViewModel>(
      builder: (context, contactModel, child) {
        return viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Fullname',
                      style: TextStyle(
                        color: Color(0xff293066),
                        fontFamily: 'Helvetica',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  textFieldSetting(controller: viewModel.fullNameController),
                  // TextField(
                  //   controller: viewModel.fullNameController,
                  //   cursorColor: Colors.black,
                  //   autocorrect: true,
                  //   style: const TextStyle(color: Colors.black),
                  //   decoration: InputDecoration(
                  //     enabledBorder: const UnderlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.black, width: 2),
                  //     ),
                  //     focusedBorder: const UnderlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.black, width: 2),
                  //     ),
                  //     hintText: widget.fullname,
                  //     hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                  //   ),
                  // ),
                  SizedBox(height: size.height * 0.03),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Color(0xff293066),
                        fontFamily: 'Helvetica',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  textFieldSetting(controller: viewModel.emailController),
                  // TextField(
                  //   controller: viewModel.notelpTextController,
                  //   cursorColor: Colors.black,
                  //   autocorrect: true,
                  //   style: const TextStyle(color: Colors.black),
                  //   decoration: InputDecoration(
                  //     enabledBorder: const UnderlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.black, width: 2),
                  //     ),
                  //     focusedBorder: const UnderlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.black, width: 2),
                  //     ),
                  //     hintText: widget.email,
                  //     hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                  //   ),
                  // ),
                  SizedBox(height: size.height * 0.03),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nomor Telepon',
                      style: TextStyle(
                        color: Color(0xff293066),
                        fontFamily: 'Helvetica',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  textFieldSetting(controller: viewModel.telpController),
                  // TextField(
                  //   controller: notelpTextController,
                  //   cursorColor: Colors.black,
                  //   autocorrect: true,
                  //   style: const TextStyle(color: Colors.black),
                  //   decoration: InputDecoration(
                  //     enabledBorder: const UnderlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.black, width: 2),
                  //     ),
                  //     focusedBorder: const UnderlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.black, width: 2),
                  //     ),
                  //     hintText: widget.phone,
                  //     hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                  //   ),
                  // ),
                  SizedBox(height: size.height * 0.03),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Alamat',
                      style: TextStyle(
                        color: Color(0xff293066),
                        fontFamily: 'Helvetica',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  textFieldSetting(controller: viewModel.alamatController),
                  // TextField(
                  //   controller: alamatTextController,
                  //   cursorColor: Colors.black,
                  //   autocorrect: true,
                  //   style: const TextStyle(color: Colors.black),
                  //   decoration: InputDecoration(
                  //     enabledBorder: const UnderlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.black, width: 2),
                  //     ),
                  //     focusedBorder: const UnderlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.black, width: 2),
                  //     ),
                  //     hintText: widget.address,
                  //     hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                  //   ),
                  // ),
                  SizedBox(height: size.height * 0.03),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nik',
                      style: TextStyle(
                        color: Color(0xff293066),
                        fontFamily: 'Helvetica',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  textFieldSetting(
                      controller: viewModel.nikController,
                      labelText: widget.profileData.nik),
                ],
              );
      },
    );
  }
}
