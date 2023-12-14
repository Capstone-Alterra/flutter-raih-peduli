class PaymentType {
  int id;
  String photo;
  String name;
  String kode;
  String url;

  PaymentType({
    required this.id,
    required this.photo,
    required this.name,
    required this.kode,
    required this.url,
  });
}

List<PaymentType> ewallet = [
  PaymentType(
      id: 10, photo: "assets/gopay.png", name: "Gopay", kode: "Gopay", url: ''),
  PaymentType(
      id: 11, photo: "assets/qris.png", name: "Qris", kode: "Qris", url: ''),
];
List<PaymentType> bank = [
  PaymentType(
      id: 4,
      photo: "assets/permata.png",
      name: "Bank Permata",
      kode: "Permata",
      url:
          "https://simulator.sandbox.midtrans.com/openapi/va/index?bank=permata"),
  PaymentType(
      id: 5,
      photo: "assets/cimb.png",
      name: "Bank CIMB Niaga",
      kode: "CIMB Niaga",
      url: "https://simulator.sandbox.midtrans.com/openapi/va/index?bank=cimb"),
  PaymentType(
      id: 6,
      photo: "assets/bca.png",
      name: "Bank BCA",
      kode: "BCA",
      url: 'https://simulator.sandbox.midtrans.com/bca/va/index'),
  PaymentType(
      id: 7,
      photo: "assets/bri.png",
      name: "Bank BRI",
      kode: "BRI",
      url: 'https://simulator.sandbox.midtrans.com/openapi/va/index?bank=bri'),
  PaymentType(
      id: 8,
      photo: "assets/bni.png",
      name: "Bank BNI",
      kode: "BNI",
      url: 'https://simulator.sandbox.midtrans.com/bni/va/index'),
  PaymentType(
      id: 9,
      photo: "assets/mandiri.png",
      name: "Bank Mandiri",
      kode: "Mandiri",
      url: "https://simulator.sandbox.midtrans.com/openapi/va/index?bank=mandiri"),
];

List<int> bankPaymentIds = bank.map((paymentType) => paymentType.id).toList();
