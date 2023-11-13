class FundraisingData {
  final String imageUrl;
  final String title;
  final String period;
  final int progress;
  final int target;
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
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Fundraising 1',
    period: '12 Des 2023 - 20 Feb 2024',
    progress: 5000,
    target: 10000,
    daysLeft: 10,
  ),
  FundraisingData(
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Fundraising 2',
    period: '12 Des 2023 - 20 Feb 2024',
    progress: 8000,
    target: 12000,
    daysLeft: 7,
  ),
  FundraisingData(
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Fundraising 3',
    period: '12 Des 2023 - 20 Feb 2024',
    progress: 3000,
    target: 5000,
    daysLeft: 15,
  ),
  FundraisingData(
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Fundraising 4',
    period: '12 Des 2023 - 20 Feb 2024',
    progress: 5000,
    target: 10000,
    daysLeft: 10,
  ),
  FundraisingData(
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Fundraising 5',
    period: '12 Des 2023 - 20 Feb 2024',
    progress: 8000,
    target: 12000,
    daysLeft: 7,
  ),
  FundraisingData(
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Fundraising 6',
    period: '12 Des 2023 - 20 Feb 2024',
    progress: 3000,
    target: 5000,
    daysLeft: 15,
  ),
];
