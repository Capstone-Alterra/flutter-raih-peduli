import 'package:flutter/material.dart';

class HistoryDonationCard extends StatelessWidget {
  const HistoryDonationCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.03,
        right: size.width * 0.03,
      ),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Container(
              width: size.width * 0.5,
              height: size.width * 0.28,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.03),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Image.network(
                    'https://i0.wp.com/ketto.blog/wp-content/uploads/2022/07/How-to-raise-funds-and-donations-during-charity-events-1.png?fit=1920%2C1080&ssl=1',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.37,
              height: size.width * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Donasi Untuk Anak - Anak Indonesia',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff293066),
                      fontSize: 12,
                      fontFamily: 'Helvetica',
                    ),
                  ),
                  const Text(
                    'Rp150.000,00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff293066),
                      fontSize: 10,
                      fontFamily: 'Helvetica',
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: size.width * 0.055, 
                    decoration: BoxDecoration(
                        color: const Color(0xffEFFAF4),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xff166648),
                          width: 1,
                        )),
                    child: const Center(
                      child: Text(
                        'Berhasil',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff166648),
                          fontSize: 12,
                          fontFamily: 'Helvetica',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
