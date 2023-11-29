import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/date_and_number_picker.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/image_picker.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/text_volunteer.dart';

class FormRequestVolunteer extends StatefulWidget {
  const FormRequestVolunteer({super.key});

  @override
  State<FormRequestVolunteer> createState() => _FormRequestVolunteerState();
}

class _FormRequestVolunteerState extends State<FormRequestVolunteer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textForVolunteer('Judul Volunteer Vacancies'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff8CA2CE).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xff8CA2CE),
              ),
            ),
            height: size.height * 0.05,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Ex. Komunikasi, Teknologi, Desain',
                hintStyle: TextStyle(
                  color: Color(0xffB0B0B0),
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
          ),
          const SizedBox(height: 18),
          textForVolunteer('Isi Deskripsi'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff8CA2CE).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xff8CA2CE),
              ),
            ),
            height: size.height * 0.15,
            child: TextFormField(
              maxLines: 10,
              decoration: const InputDecoration(
                hintText:
                    'Ex. Membantu dalam mengajar dan membimbing anak-anak untuk meningkatkan pendidikan mereka.',
                hintStyle: TextStyle(
                  color: Color(0xffB0B0B0),
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
          ),
          const SizedBox(height: 18),
          textForVolunteer('Skill Yang Diperlukan'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff8CA2CE).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xff8CA2CE),
              ),
            ),
            height: size.height * 0.05,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Pilih Kategori skill',
                hintStyle: TextStyle(
                  color: Color(0xffB0B0B0),
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
          ),
          const SizedBox(height: 18),
          const DateAndTotalVacancies(),
          const SizedBox(height: 18),
          textForVolunteer('Email'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff8CA2CE).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xff8CA2CE),
              ),
            ),
            height: size.height * 0.05,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Ex. Komunikasi, Teknologi, Desain',
                hintStyle: TextStyle(
                  color: Color(0xffB0B0B0),
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
          ),
          const SizedBox(height: 18),
          textForVolunteer('Unggah Gambar Lowongan Relawan'),
          const SizedBox(height: 8),
          const ImagePicker(),
        ],
      ),
    );
  }
}
