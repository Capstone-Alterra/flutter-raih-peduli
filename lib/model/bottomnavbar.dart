class ModelNavBar {
  String image;
  String title;

  ModelNavBar({required this.image, required this.title});
}

List<ModelNavBar> contents = [
  ModelNavBar (
    title: 'Beranda',
    image: 'assets/home.svg',
  ),
  ModelNavBar (
    title: 'Chatbot',
    image: 'assets/chatbubble.svg',
  ),
  ModelNavBar (
    title: 'Riwayat',
    image: 'assets/notepad.svg',
  ),
  ModelNavBar (
    title: 'Pengaturan',
    image: 'assets/settings.svg',
  ),
];