// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_raih_peduli/screen/view/riwayat/detail_riwayat.dart';
import 'package:flutter_raih_peduli/screen/view/riwayat/widgets/card_riwayat.dart';
import 'package:flutter_raih_peduli/screen/view/riwayat/widgets/skil.dart';
import 'package:flutter_raih_peduli/screen/view/riwayat/widgets/status.dart';
import 'package:flutter_svg/svg.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;
    final heightCard = heightMediaQuery / 6.5;
    final widthContent = widthMediaQuery / 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF293066),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailRiwayat(
                      title: "Donasi Untuk Anak",
                    ),
                  ),
                );
              },
              child: cardRiwayat(
                contentRiwayat: SizedBox(
                  height: heightCard,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Donasi Untuk Anak",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF293066),
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Rp. 150.000",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF293066),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: widthMediaQuery / 2.5,
                        height: 20,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFFAF4),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                          border: Border.all(
                            color: const Color(0xFF166648),
                            width: 0.7,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Berhasil',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: cardRiwayat(
                contentRiwayat: SizedBox(
                  height: heightCard,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Banjir di parit",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF293066),
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Skil',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            Row(
                              children: [
                                skil(
                                  size: widthMediaQuery / 8,
                                  text: "Perawat",
                                ),
                                const SizedBox(width: 5),
                                skil(
                                  size: widthMediaQuery / 8,
                                  text: "Konseling",
                                ),
                                const SizedBox(width: 5),
                                skil(
                                  size: widthMediaQuery / 8,
                                  text: "Dokter",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: widthContent / 1.25,
                        height: 20,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFFAF4),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                          border: Border.all(
                            color: const Color(0xFFBB5902),
                            width: 0.7,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Pending',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            cardRiwayat(
              contentRiwayat: SizedBox(
                height: heightCard,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Request Program",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF293066),
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          '12 Desember - 20 Februari 2024',
                          style: TextStyle(
                            fontSize: 9,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: widthMediaQuery / 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Target ",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        'assets/target_panah.svg',
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    '1.000.000',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Hari ",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        'assets/kalender.svg',
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    '10 Hari',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    statusRiwayat(
                      text: "Pending",
                      sizeHeight: 20,
                      sizeWidht: widthContent / 1.25,
                      color: const Color(0xFFBB5902),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
