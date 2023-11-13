class VolunteerData {
  final String imageUrl;
  final String title;
  final String period;
  final double progress;
  final String region;
  final String location;
  final int slot;

  VolunteerData({
    required this.imageUrl,
    required this.title,
    required this.period,
    required this.progress,
    required this.region,
    required this.location,
    required this.slot,
  });
}

List<VolunteerData> dummyVolunteerData = [
  VolunteerData(
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Volunteer 1',
    period: 'Jan 1, 2023 - Feb 1, 2023',
    progress: 0.3,
    region: 'Jakarta',
    location: 'Jakarta Pinggir',
    slot: 5,
  ),
  VolunteerData(
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Volunteer 2',
    period: 'Feb 15, 2023 - Mar 15, 2023',
    progress: 0.7,
    region: 'Surabaya',
    location: 'Surabaya Pinggir',
    slot: 8,
  ),
  VolunteerData(
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Volunteer 3',
    period: 'Mar 5, 2023 - Apr 5, 2023',
    progress: 0.5,
    region: 'Bandung',
    location: 'Bandung Pinggir',
    slot: 3,
  ),
  VolunteerData(
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Volunteer 1',
    period: 'Jan 1, 2023 - Feb 1, 2023',
    progress: 0.3,
    region: 'Jakarta',
    location: 'Jakarta Pinggir',
    slot: 5,
  ),
  VolunteerData(
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Volunteer 2',
    period: 'Feb 15, 2023 - Mar 15, 2023',
    progress: 0.7,
    region: 'Surabaya',
    location: 'Surabaya Pinggir',
    slot: 8,
  ),
  VolunteerData(
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Volunteer 3',
    period: 'Mar 5, 2023 - Apr 5, 2023',
    progress: 0.5,
    region: 'Bandung',
    location: 'Bandung Pinggir',
    slot: 3,
  ),
];
