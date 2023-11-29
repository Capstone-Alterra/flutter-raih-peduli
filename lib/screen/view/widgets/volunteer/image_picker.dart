import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
    );
  }
}
