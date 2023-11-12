class FundraisingData {
  final String imageUrl;
  final String title;
  final String period;
  final double progress;
  final double target;
  final int daysLeft;

  FundraisingData({
    required this.imageUrl,
    required this.title,
    required this.period,
    required this.progress,
    required this.target,
    required this.daysLeft,
  });
}

List<FundraisingData> dummyFundraisingData = [
  FundraisingData(
    imageUrl: 'https://example.com/image1.jpg',
    title: 'Fundraising 1',
    period: '12 Desember 2023 - 20 Februari 2024',
    progress: 5000.0,
    target: 10000.0,
    daysLeft: 10,
  ),
  FundraisingData(
    imageUrl: 'https://example.com/image2.jpg',
    title: 'Fundraising 2',
    period: '12 Desember 2023 - 20 Februari 2024',
    progress: 8000.0,
    target: 12000.0,
    daysLeft: 7,
  ),
  FundraisingData(
    imageUrl: 'https://example.com/image3.jpg',
    title: 'Fundraising 3',
    period: '12 Desember 2023 - 20 Februari 2024',
    progress: 3000.0,
    target: 5000.0,
    daysLeft: 15,
  ),
];
