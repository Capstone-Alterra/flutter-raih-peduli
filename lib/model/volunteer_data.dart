class VolunteerData {
  final int id;
  final String imageUrl;
  final String title;
  final String description;
  final String period;
  final double progress;
  final String region;
  final String location;
  final List<String> syarat;
  final List<String> skill;
  final int slot;

  VolunteerData({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.period,
    required this.progress,
    required this.region,
    required this.location,
    required this.syarat,
    required this.skill,
    required this.slot,
  });
}

List<VolunteerData> dummyVolunteerData = [
  VolunteerData(
    id: 1,
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Volunteer 1',
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    period: 'Jan 1, 2023 - Feb 1, 2023',
    progress: 0.3,
    region: 'Jakarta',
    location: 'Jakarta Pinggir',
    syarat: ['Syarat 1', 'Syarat 2', 'Syarat 3'],
    skill: ['Skill 1', 'Skill 2', 'Skill 3'],
    slot: 5,
  ),
  VolunteerData(
    id: 2,
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Volunteer 2',
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    period: 'Feb 15, 2023 - Mar 15, 2023',
    progress: 0.7,
    region: 'Surabaya',
    location: 'Surabaya Pinggir',
    syarat: ['Syarat 1', 'Syarat 2', 'Syarat 3'],
    skill: ['Skill 1', 'Skill 2', 'Skill 3'],
    slot: 8,
  ),
  VolunteerData(
    id: 3,
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Volunteer 3',
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    period: 'Mar 5, 2023 - Apr 5, 2023',
    progress: 0.5,
    region: 'Bandung',
    location: 'Bandung Pinggir',
    syarat: ['Syarat 1', 'Syarat 2', 'Syarat 3'],
    skill: ['Skill 1', 'Skill 2', 'Skill 3'],
    slot: 3,
  ),
  VolunteerData(
    id: 4,
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Volunteer 4',
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    period: 'Jan 1, 2023 - Feb 1, 2023',
    progress: 0.3,
    region: 'Jakarta',
    location: 'Jakarta Pinggir',
    syarat: ['Syarat 1', 'Syarat 2', 'Syarat 3'],
    skill: ['Skill 1', 'Skill 2', 'Skill 3'],
    slot: 5,
  ),
  VolunteerData(
    id: 5,
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Volunteer 5',
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    period: 'Feb 15, 2023 - Mar 15, 2023',
    progress: 0.7,
    region: 'Surabaya',
    location: 'Surabaya Pinggir',
    syarat: ['Syarat 1', 'Syarat 2', 'Syarat 3'],
    skill: ['Skill 1', 'Skill 2', 'Skill 3'],
    slot: 8,
  ),
  VolunteerData(
    id: 6,
    imageUrl: 'https://donorbox.org/nonprofit-blog/wp-content/uploads/2019/01/iStock-622065910-1084x723-1024x683.jpg',
    title: 'Volunteer 6',
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    period: 'Mar 5, 2023 - Apr 5, 2023',
    progress: 0.5,
    region: 'Bandung',
    location: 'Bandung Pinggir',
    syarat: ['Syarat 1', 'Syarat 2', 'Syarat 3'],
    skill: ['Skill 1', 'Skill 2', 'Skill 3'],
    slot: 3,
  ),
];
