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
import 'package:flutter_raih_peduli/screen/view/widgets/settings/text_field_setting.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/settings/text_title_text_field.dart';
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
                  textSetting(text: "Fullname"),
                  textFieldSetting(
                    controller: viewModel.fullNameController,
                    labelText: widget.profileData.fullname,
                  ),
                  textSetting(text: "Email"),
                  textFieldSetting(
                    controller: viewModel.emailController,
                    labelText: widget.profileData.email,
                  ),
                  SizedBox(height: size.height * 0.03),
                  textSetting(text: "Nomor Telepon"),
                  textFieldSetting(
                    controller: viewModel.telpController,
                    labelText: widget.profileData.phoneNumber,
                  ),
                  SizedBox(height: size.height * 0.03),
                  textSetting(text: "Alamat"),
                  textFieldSetting(
                    controller: viewModel.alamatController,
                    labelText: widget.profileData.address,
                  ),
                  SizedBox(height: size.height * 0.03),
                  textSetting(text: "Nik"),
                  textFieldSetting(
                    controller: viewModel.nikController,
                    labelText: widget.profileData.nik,
                  ),
                ],
              );
      },
    );
  }
}
