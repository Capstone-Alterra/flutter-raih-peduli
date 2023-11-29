import 'package:flutter/material.dart';

class ButtonRequestVolunteer extends StatefulWidget {
  const ButtonRequestVolunteer({super.key});

  @override
  State<ButtonRequestVolunteer> createState() => _ButtonRequestVolunteerState();
}

class _ButtonRequestVolunteerState extends State<ButtonRequestVolunteer> {
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
            onPressed: () {},
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