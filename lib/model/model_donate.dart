import 'package:intl/intl.dart';

class ModelonDonate {
  final int id;
  final String image;
  final String title;
  final String donated;
  final String time;
  final String description;

  ModelonDonate({
    required this.id,
    required this.image,
    required this.title,
    required this.donated,
    required this.time,
    required this.description,
  });

  String get remainingDays {
    final endDate = DateFormat('yyyy-MM-dd').parse(time.split(' - ')[1]);
    final today = DateTime.now();
    final difference = endDate.difference(today).inDays;
    return difference.toString();
  }
}

List<ModelonDonate> contents = [
  ModelonDonate(
    id: 1,
    title: 'Bantu Anak Anak Sekolah',
    image: 'assets/donate.jpg',
    donated: 'Rp 20.000.000',
    time: '2024-03-26 - 2024-04-28',
    description:
        "Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan.",
  ),
  ModelonDonate(
    id: 2,
    title: 'Bantu Free Palestine',
    image: 'assets/donate.jpg',
    donated: 'Rp 50.000.000',
    time: '2024-03-26 - 2024-04-28',
    description:
        "Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan.",
  ),
  ModelonDonate(
    id: 3,
    title: 'Belajar Untuk Merasa Kasian',
    image: 'assets/donate.jpg',
    donated: 'Rp 2.000.000',
    time: '2024-03-26 - 2024-04-28',
    description:
        "Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan.",
  ),
  ModelonDonate(
    id: 4,
    title: 'Donasi Untuk Saya',
    image: 'assets/donate.jpg',
    donated: 'Rp 200.000.000',
    time: '2024-03-26 - 2024-04-28',
    description:
        "Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan.",
  ),
];
