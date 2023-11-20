import 'package:flutter/material.dart';

class News extends StatefulWidget {
  final String? title;
  final String? image;
  final String? description;

  const News({Key? key, this.title, this.image, this.description})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffFFFFFF),
      elevation: 3,
      margin: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian Kiri (Image)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                widget.image ?? '',
                height: 115,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Bagian Kanan (Title, Description, dan Button)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF293066),
                      fontSize: 10,

                      // Ganti warna teks menjadi biru
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.description ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  // Centered Button
                  Center(
                    child: SizedBox(
                      width: 200, // Sesuaikan lebar sesuai kebutuhan
                      height: 25, // Sesuaikan tinggi sesuai kebutuhan
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailPage(
                                title: widget.title ?? '',
                                image: widget.image ?? '',
                                description: widget.description ?? '',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF293066),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: const Text(
                          'Baca Selengkapnya',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  const NewsDetailPage({
    Key? key,
    required this.title,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text('Detail Berita'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(image, fit: BoxFit.cover),
              ),
              const SizedBox(height: 10.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF293066),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                description,
                maxLines: null,
                style: const TextStyle(
                  color: Color(0xFF293066),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
