import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/settings/edit_profile.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/dialog_popup.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/snackbar.dart';

class ButtonVolunteer extends StatefulWidget {
  const ButtonVolunteer({super.key});

  @override
  State<ButtonVolunteer> createState() => _ButtonVolunteerState();
}

class _ButtonVolunteerState extends State<ButtonVolunteer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
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
            onPressed: () {
              final snackBar = snackBarVolunteer(size, context);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Future.delayed(const Duration(seconds: 3), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileEdit()),
                );
              });
            },
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
            onPressed: () {
              showCustomDialog(context, size);
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
    );
  }
}
