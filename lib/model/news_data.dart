class NewsData {
  final String imageUrl;
  final String title;
  final String description;

  NewsData({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

List<NewsData> dummyNewsData = [
  NewsData(
    imageUrl: 'https://example.com/news_image1.jpg',
    title: 'Berita 1',
    description: 'Deskripsi berita 1...',
  ),
  NewsData(
    imageUrl: 'https://example.com/news_image2.jpg',
    title: 'Berita 2',
    description: 'Deskripsi berita 2...',
  ),
  NewsData(
    imageUrl: 'https://example.com/news_image3.jpg',
    title: 'Berita 3',
    description: 'Deskripsi berita 3...',
  ),
];
