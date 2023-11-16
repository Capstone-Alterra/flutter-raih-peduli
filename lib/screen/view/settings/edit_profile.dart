import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/widget_profile_edit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ubah Profile',
          style: TextStyle(
              color: Color(0xff293066),
              fontFamily: 'Helvetica',
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
        child: Align(
          alignment: const AlignmentDirectional(0.00, 0.00),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: size.width * 0.36,
                  height: size.height * 0.16,
                  child: Stack(
                    children: [
                      Container(
                        width: size.width * 0.35,
                        height: size.height * 0.35,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://picsum.photos/seed/780/600',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.00, 1.00),
                        child: SvgPicture.asset('assets/edit.svg'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.1),
              const EditTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
