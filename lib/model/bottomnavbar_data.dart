class ModelNavBar {
  String image;
  String title;

  ModelNavBar({required this.image, required this.title});
}

List<ModelNavBar> contents = [
  ModelNavBar(
    title: 'Beranda',
    image: 'assets/icons/home/home.svg',
  ),
  ModelNavBar(
    title: 'Chatbot',
    image: 'assets/icons/home/chatbubble.svg',
  ),
  ModelNavBar(
    title: 'Riwayat',
    image: 'assets/icons/home/notepad.svg',
  ),
  ModelNavBar(
    title: 'Pengaturan',
    image: 'assets/icons/home/settings.svg',
  ),
];
