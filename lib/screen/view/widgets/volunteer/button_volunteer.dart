import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/settings/edit_profile.dart';
// import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/dialog_popup.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/snackbar.dart';
import 'package:flutter_raih_peduli/screen/view_model/view_model_detail_volunteer.dart';
import 'package:provider/provider.dart';

class ButtonVolunteer extends StatefulWidget {
  final int volunteerId;

  const ButtonVolunteer({Key? key, required this.volunteerId})
      : super(key: key);

  @override
  State<ButtonVolunteer> createState() =>
      _ButtonVolunteerState(volunteerId: volunteerId);
}

class _ButtonVolunteerState extends State<ButtonVolunteer> {
  // final DetailVolunteerViewModel viewModel = DetailVolunteerViewModel();
  final int volunteerId;

  _ButtonVolunteerState({required this.volunteerId});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<DetailVolunteerViewModel>(context, listen: false);
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
              final snackBar = snackBarVolunteer(
                size,
                context,
                message:
                    'Masukkan NIK terlebih dahulu sebelum memulai aplikasi Raih Peduli :)',
                isError: true,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Future.delayed(const Duration(seconds: 4), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileEdit()),
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
            onPressed: () async {
              //showCustomDialog(context, size);
              await viewModel.tambahData(context, volunteerId);
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
