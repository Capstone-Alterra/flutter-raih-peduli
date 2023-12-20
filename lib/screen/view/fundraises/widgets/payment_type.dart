import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/theme.dart';

Widget customPaymentType(
    {required String photo, double? height,VoidCallback? onTap, required String text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                width: 1, color: AppTheme.primaryColor.withOpacity(0.3))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: Center(
                        child: Image.asset(
                          photo,
                          // width: 90,
                          height: height,
                        ),
                      ),
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                        color: AppTheme.black,
                        fontSize: 14.0,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Icon(
              Icons.navigate_next,
              color: AppTheme.primaryColor,
            ),
          ],
        ),
      ),
    ),
  );
}
