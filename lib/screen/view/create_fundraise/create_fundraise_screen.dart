// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/create_fundraise/form_create_fundraise.dart';
import 'package:flutter_raih_peduli/screen/view/navigation/navigation.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_create_fundraise.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_signin.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';

import '../../../theme.dart';
import '../widgets/login_signup/alert.dart';
// import '../widgets/volunteer/text_form.dart';

class CreateFundraise extends StatefulWidget {
  const CreateFundraise({Key? key}) : super(key: key);

  @override
  State<CreateFundraise> createState() => _CreateFundraiseState();
}

class _CreateFundraiseState extends State<CreateFundraise> {
  late ViewModelCreateFundraises viewModel;
  late SignInViewModel sp;
  @override
  void initState() {
    viewModel = Provider.of<ViewModelCreateFundraises>(context, listen: false);
    sp = Provider.of<SignInViewModel>(context, listen: false);
    super.initState();
    viewModel.clearAll();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final rataRata = (size.height + size.width) / 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Buat Penggalangan Dana',
          style: TextStyle(
              color: const Color(0xff293066),
              fontFamily: 'Helvetica',
              fontSize: rataRata / 35,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppTheme.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
            // viewModel.clearAll();
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: FormCreateFundraise(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff8CA2CE).withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xff293066),
                ),
              ),
              height: size.height * 0.06,
              width: size.width * 0.43,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                ),
                child: const Text(
                  'Batal',
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff293066),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff293066),
                borderRadius: BorderRadius.circular(8),
              ),
              height: size.height * 0.06,
              width: size.width * 0.43,
              child: ElevatedButton(
                onPressed: () async {
                  if (viewModel.formKey.currentState!.validate()) {
                    await viewModel.createFundraising(
                      accessToken: sp.accessTokenSharedPreference,
                      refreshToken: sp.refreshTokenSharedPreference,
                    );
                    if (viewModel.isSukses == true) {
                      customAlert(
                        context: context,
                        alertType: QuickAlertType.custom,
                        customAsset: 'assets/Group 427318233.png',
                        text: 'Berhasil membuat penggalangan dana',
                        afterDelay: () {
                          // Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const BottomNavgationBar(),
                            ),
                          );
                        },
                      );
                      viewModel.clearAll();
                    } else {
                      customAlert(
                        context: context,
                        alertType: QuickAlertType.error,
                        text: 'Terjadi kesalahan mohon coba lagi',
                      );
                    }
                  }
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                ),
                child: const Text(
                  'Tambah',
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
