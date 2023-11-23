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
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Fundraising 1',
    description : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    time: '2024-03-26 - 2024-04-28',
    progress: 5000,
    target: 10000,
  ),
  FundraisingData(
    id: 2,
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Fundraising 2',
    description : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    time: '2024-03-26 - 2024-04-28',
    progress: 8000,
    target: 12000,
  ),
  FundraisingData(
    id: 3,
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Fundraising 3',
    description : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    time: '2024-03-26 - 2024-04-28',
    progress: 3000,
    target: 5000,
  ),
  FundraisingData(
    id: 4,
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Fundraising 4',
    description : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    time: '2024-03-26 - 2024-04-28',
    progress: 5000,
    target: 10000,
  ),
  FundraisingData(
    id: 5,
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Fundraising 5',
    description : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    time: '2024-03-26 - 2024-04-28',
    progress: 8000,
    target: 12000,
  ),
  FundraisingData(
    id: 6,
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Fundraising 6',
    description : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    time: '2024-03-26 - 2024-04-28',
    progress: 3000,
    target: 5000,
  ),
];
