class ModelOnBoarding {
  String image;
  String title;
  String discription;

  ModelOnBoarding(
      {required this.image, required this.title, required this.discription});
}

List<ModelOnBoarding> contents = [
  ModelOnBoarding(
      title: 'Selamat datang di Raih Peduli',
      image: 'assets/slide1.svg',
      discription:
          "Di sinilah semangat peduli, aksi, dan pengaruh positif bersatu. Kami mengajak Anda untuk menjadi bagian dari perubahan yang Anda inginkan."),
  ModelOnBoarding(
      title: 'Penggalangan Dana Mudah',
      image: 'assets/slide2.svg',
      discription:
          "Dengan satu klik, Anda dapat memberikan dampak nyata pada Kehidupan. Setiap donasi Anda memiliki arti besar."),
  ModelOnBoarding(
      title: 'Mulailah Menjadi Sukarelawan',
      image: 'assets/slide3.svg',
      discription:
          "Berikan waktu Anda untuk tujuan baik dan Nikmati Kontribusinya. Jadilah bagian dari perubahan yang Anda inginkan untuk lihat di dunia."),
  ModelOnBoarding(
      title: 'Nikmati Perjalanan Donasi Anda',
      image: 'assets/slide4.svg',
      discription:
          "Temukan cara terbaik untuk memulai perjalanan Anda dalam memberikan kontribusi positif melalui aplikasi donasi kami."),
];
