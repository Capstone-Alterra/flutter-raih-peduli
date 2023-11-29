// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class EditTextField extends StatefulWidget {
  String email;
  String fullname;
  String phone;
  String address;
  EditTextField(
      {required this.email,
      required this.fullname,
      required this.phone,
      required this.address,
      super.key});

  @override
  State<EditTextField> createState() => EditTextFieldState();
}

class EditTextFieldState extends State<EditTextField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController emailTextController = TextEditingController();
    final TextEditingController notelpTextController = TextEditingController();
    final TextEditingController alamatTextController = TextEditingController();
    final TextEditingController passwordTextController =
        TextEditingController();
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Nama',
            style: TextStyle(
              color: Color(0xff293066),
              fontFamily: 'Helvetica',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextField(
          controller: emailTextController,
          cursorColor: Colors.black,
          autocorrect: true,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            hintText: widget.fullname,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
          ),
        ),
        SizedBox(height: size.height * 0.03),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Email',
            style: TextStyle(
              color: Color(0xff293066),
              fontFamily: 'Helvetica',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextField(
          controller: emailTextController,
          cursorColor: Colors.black,
          autocorrect: true,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            hintText: widget.email,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
          ),
        ),
        SizedBox(height: size.height * 0.03),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Kata Sandi',
            style: TextStyle(
              color: Color(0xff293066),
              fontFamily: 'Helvetica',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextField(
          controller: passwordTextController,
          obscureText: true,
          cursorColor: Colors.black,
          autocorrect: true,
          style: const TextStyle(color: Colors.black),
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.03),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Nomor Telepon',
            style: TextStyle(
              color: Color(0xff293066),
              fontFamily: 'Helvetica',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextField(
          controller: notelpTextController,
          cursorColor: Colors.black,
          autocorrect: true,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            hintText: widget.phone,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
          ),
        ),
        SizedBox(height: size.height * 0.03),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Alamat',
            style: TextStyle(
              color: Color(0xff293066),
              fontFamily: 'Helvetica',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextField(
          controller: alamatTextController,
          cursorColor: Colors.black,
          autocorrect: true,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            hintText: widget.address,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
          ),
        ),
      ],
    );
  }
}
