import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/widgets/volunteer/text_volunteer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFormVolunteer extends StatefulWidget {
  const TextFormVolunteer({super.key});

  @override
  State<TextFormVolunteer> createState() => TextFormVolunteerState();
}

class TextFormVolunteerState extends State<TextFormVolunteer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textForVolunteer('Skill'),
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
        textForVolunteer('Resume'),
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
                  'Ex. Seorang individu yang berkomitmen untuk memberikan dampak positif pada masyarakat dan masa depan generasi penerus.',
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
        textForVolunteer('Alasan Mengikuti'),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff8CA2CE).withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xff8CA2CE),
            ),
          ),
          height: size.height * 0.12,
          child: TextFormField(
            maxLines: 10,
            decoration: const InputDecoration(
              hintText:
                  'Ex. Ingin membantu dalam mengajar dan membimbing anak-anak untuk meningkatkan pendidikan mereka.',
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
        textForVolunteer('Foto'),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff8CA2CE).withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xff8CA2CE),
            ),
          ),
          height: size.height * 0.07,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              size.width * 0.05,
              0,
              0,
              0,
            ),
            child: Stack(
              alignment: const AlignmentDirectional(-1, 0),
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: size.width * 0.33,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xff8CA2CE),
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/upload_foto.svg'),
                      ),
                      const Text(
                        'Upload Foto',
                        style: TextStyle(
                            color: Color(0xff293066),
                            fontFamily: 'Helvetica',
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
