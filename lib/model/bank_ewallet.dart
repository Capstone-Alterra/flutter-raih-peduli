class PaymentType{
  int id;
  String photo;
  String name;


  PaymentType({
    required this.id,
    required this.photo,
    required this.name,
});
}

List<PaymentType> ewallet = [
  PaymentType(
    id: 10,
    photo: "assets/gopay.png",
      name: "Gopay"
  ),PaymentType(
    id: 11,
    photo: "assets/qris.png",
      name: "Qris"
  ),
];
List<PaymentType> bank = [
  PaymentType(
      id: 4,
      photo: "assets/permata.png",
      name: "Bank Permata"
  ),
  PaymentType(
      id: 5,
      photo: "assets/cimb.png",
      name: "Bank CIMB Niaga"
  ),
  PaymentType(
      id: 6,
      photo: "assets/bca.png",
      name: "Bank BCA"
  ),
  PaymentType(
      id: 7,
      photo: "assets/bri.png",
      name: "Bank BRI"
  ), PaymentType(
      id: 8,
      photo: "assets/bni.png",
      name: "Bank BNI"
  ), PaymentType(
      id: 9 ,
      photo: "assets/mandiri.png",
      name: "Bank Mandiri"
  ),
];

List<int> bankPaymentIds = bank.map((paymentType) => paymentType.id).toList();