class VolunteerData {
  final String imageUrl;
  final String title;
  final String period;
  final double progress;
  final String location;
  final int slot;

  VolunteerData({
    required this.imageUrl,
    required this.title,
    required this.period,
    required this.progress,
    required this.location,
    required this.slot,
  });
}

List<VolunteerData> dummyVolunteerData = [
  VolunteerData(
    imageUrl: 'https://example.com/volunteer_image1.jpg',
    title: 'Volunteer 1',
    period: 'Jan 1, 2023 - Feb 1, 2023',
    progress: 0.3,
    location: 'Jakarta',
    slot: 5,
  ),
  VolunteerData(
    imageUrl: 'https://example.com/volunteer_image2.jpg',
    title: 'Volunteer 2',
    period: 'Feb 15, 2023 - Mar 15, 2023',
    progress: 0.7,
    location: 'Surabaya',
    slot: 8,
  ),
  VolunteerData(
    imageUrl: 'https://example.com/volunteer_image3.jpg',
    title: 'Volunteer 3',
    period: 'Mar 5, 2023 - Apr 5, 2023',
    progress: 0.5,
    location: 'Bandung',
    slot: 3,
  ),
];
