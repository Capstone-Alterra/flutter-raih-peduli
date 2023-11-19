import 'package:intl/intl.dart';

class FundraisingData {
  final int id;
  final String imageUrl;
  final String title;
  final String description;
  final String time;
  final int progress;
  final int target;

  FundraisingData({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.time,
    required this.progress,
    required this.target,
  });

  String get remainingDays {
    final endDate = DateFormat('yyyy-MM-dd').parse(time.split(' - ')[1]);
    final today = DateTime.now();
    final difference = endDate.difference(today).inDays;
    return difference.toString();
  }
}

List<FundraisingData> dummyFundraisingData = [
  FundraisingData(
    id: 1,
    imageUrl: 'assets/icons/donate.svg',
    title: 'Fundraising 1',
    description:
        'Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. 1',
    time: '2024-03-26 - 2024-04-28',
    progress: 5000,
    target: 10000,
  ),
  FundraisingData(
    id: 2,
    imageUrl: 'assets/icons/donate.svg',
    title: 'Fundraising 2',
    description:
        'Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. 2',
    time: '2024-03-26 - 2024-04-28',
    progress: 8000,
    target: 12000,
  ),
  FundraisingData(
    id: 3,
    imageUrl: 'assets/icons/donate.svg',
    title: 'Fundraising 3',
    description:
        'Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. 3',
    time: '2024-03-26 - 2024-04-28',
    progress: 3000,
    target: 5000,
  ),
  FundraisingData(
    id: 4,
    imageUrl: 'assets/icons/donate.svg',
    title: 'Fundraising 4',
    description:
        'Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. 4',
    time: '2024-03-26 - 2024-04-28',
    progress: 5000,
    target: 10000,
  ),
  FundraisingData(
    id: 5,
    imageUrl: 'assets/icons/donate.svg',
    title: 'Fundraising 5',
    description:
        'Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. 5',
    time: '2024-03-26 - 2024-04-28',
    progress: 8000,
    target: 12000,
  ),
  FundraisingData(
    id: 6,
    imageUrl: 'assets/icons/donate.svg',
    title: 'Fundraising 6',
    description:
        'Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. Membantu anak-anak kurang mampu mendapatkan pendidikan dan perawatan yang mereka butuhkan. 6',
    time: '2024-03-26 - 2024-04-28',
    progress: 3000,
    target: 5000,
  ),
];
