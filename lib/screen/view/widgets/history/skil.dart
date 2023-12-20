import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme.dart';

class SkillHistory extends StatelessWidget {
  const SkillHistory({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Wrap(
      children: [
        Container(
          // margin: const EdgeInsets.all(4.0),
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.007,
          ),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              width: 1.0,
              color: AppTheme.primaryColor,
            ),
          ),
          child: const Text(
            'Pendidikan',
            style: TextStyle(
                fontSize: 8,
                color: AppTheme.primaryColor,
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
