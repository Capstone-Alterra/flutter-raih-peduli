import 'package:flutter/material.dart';

import 'newsdetailpage.dart';
// import 'package:flutter_raih_peduli/News/widget/newsdetailpage.dart';

class News extends StatefulWidget {
  final String? title;
  final String? image;
  final String? description;

  const News({super.key, this.title, this.image, this.description});

  @override
  // ignore: library_private_types_in_public_api
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    // Simpan nilai dalam variabel lokal untuk kejelasan yang lebih baik
    String title = widget.title ?? '';
    String image = widget.image ?? '';
    String description = widget.description ?? '';

    return Card(
      color: const Color(0xffFFFFFF),
      elevation: 0,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: const BorderSide(color: Colors.black, width: 0.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                image,
                height: 115,
                width: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF293066),
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 25,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailPage(
                                title: title,
                                image: image,
                                description: description,
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
