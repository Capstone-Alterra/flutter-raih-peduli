class HistoryDonationModel {
  List<Datum> data;
  String message;

  HistoryDonationModel({
    required this.data,
    required this.message,
  });

  factory HistoryDonationModel.fromJson(Map<String, dynamic> json) =>
      HistoryDonationModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  int transactionId;
  int userId;
  String email;
  String fullname;
  String address;
  String phoneNumber;
  int fundraiseId;
  String fundraiseName;
  String fundraisePhoto;
  int amount;
  String paymentType;
  String virtualAccount;
  String urlCallback;
  String paidAt;
  DateTime validUntil;
  String status;
  DateTime createdAt;
  String postType;

  Datum({
    required this.transactionId,
    required this.userId,
    required this.email,
    required this.fullname,
    required this.address,
    required this.phoneNumber,
    required this.fundraiseId,
    required this.fundraiseName,
    required this.fundraisePhoto,
    required this.amount,
    required this.paymentType,
    required this.virtualAccount,
    required this.urlCallback,
    required this.paidAt,
    required this.validUntil,
    required this.status,
    required this.createdAt,
    required this.postType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        transactionId: json["transaction_id"],
        userId: json["user_id"],
        email: json["email"],
        fullname: json["fullname"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        fundraiseId: json["fundraise_id"],
        fundraiseName: json["fundraise_name"],
        fundraisePhoto: json["fundraise_photo"],
        amount: json["amount"],
        paymentType: json["payment_type"],
        virtualAccount: json["virtual_account"],
        urlCallback: json["url_callback"],
        paidAt: json["paid_at"],
        validUntil: DateTime.parse(json["valid_until"]),
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        postType: json["post_type"],
      );

  Map<String, dynamic> toJson() => {
        "transaction_id": transactionId,
        "user_id": userId,
        "email": email,
        "fullname": fullname,
        "address": address,
        "phone_number": phoneNumber,
        "fundraise_id": fundraiseId,
        "fundraise_name": fundraiseName,
        "fundraise_photo": fundraisePhoto,
        "amount": amount,
        "payment_type": paymentType,
        "virtual_account": virtualAccount,
        "url_callback": urlCallback,
        "paid_at": paidAt,
        "valid_until": validUntil.toIso8601String(),
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "post_type": postType,
      };
}
