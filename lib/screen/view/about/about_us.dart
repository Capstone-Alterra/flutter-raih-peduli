import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back, // Use the default back arrow icon
            color: Colors.black, // Set the color of the back arrow icon
          ),
          onPressed: () {
            Navigator.pop(
                context); // Navigate back when the back arrow is pressed
          },
        ),
        title: const Text(
          'Tentang Kami',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF293066),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 25), // Spacer untuk memberi jarak dari atas

          // Logo Raih Peduli
          Image.asset(
            'assets/icons/raih_peduli_logo.png', // Ganti dengan path/logo sesuai kebutuhan
            width: 136.00003, // Sesuaikan ukuran logo
            height: 127.04741,
          ),
          const SizedBox(
            height: 10.0,
          ),
          // Tulisan Raih Peduli
          const Text(
            'RAIH PEDULI',
            style: TextStyle(
              fontSize: 27.37,
              color: Color(0xFF293066),
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Raih keberkahan dengan kepedulian',
            style: TextStyle(
              fontSize: 10.15,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          // Deskripsi
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Kami adalah komunitas yang tumbuh dengan semangat untuk memberdayakan perubahan positif. Di Raih Peduli, kami percaya bahwa kepedulian adalah kunci untuk meraih masyarakat yang lebih baik. Sejak awal, misi kami adalah menyinari dunia dengan aksi sosial yang bermakna. Setiap langkah yang kami ambil, setiap donasi yang kami terima, dan setiap sukarelawan yang bergabung membentuk fondasi kami untuk meraih lebih\n banyak lagi.',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Bersama, mari kita wujudkan dampak yang berarti\n dan raih kebaikan bersama Raih Peduli.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
