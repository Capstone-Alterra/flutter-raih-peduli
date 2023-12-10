import 'dart:convert';

HistoryDonationModel historyDonationModelFromJson(Map<String, dynamic> map) =>
    HistoryDonationModel.fromJson(map);

String historyDonationModelToJson(HistoryDonationModel data) =>
    json.encode(data.toJson());

class HistoryDonationModel {
  final List<Datum> data;
  final String message;

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
  final int transactionId;
  final int userId;
  final String email;
  final String fullname;
  final String address;
  final String phoneNumber;
  final String profilePicture;
  final int fundraiseId;
  final int amount;
  final String paymentType;
  final String virtualAccount;
  final String urlCallback;
  final String paidAt;
  final String status;
  final String postType;

  Datum({
    required this.transactionId,
    required this.userId,
    required this.email,
    required this.fullname,
    required this.address,
    required this.phoneNumber,
    required this.profilePicture,
    required this.fundraiseId,
    required this.amount,
    required this.paymentType,
    required this.virtualAccount,
    required this.urlCallback,
    required this.paidAt,
    required this.status,
    required this.postType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        transactionId: json["transaction_id"],
        userId: json["user_id"],
        email: json["email"],
        fullname: json["fullname"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        profilePicture: json["profile_picture"],
        fundraiseId: json["fundraise_id"],
        amount: json["amount"],
        paymentType: json["payment_type"],
        virtualAccount: json["virtual_account"],
        urlCallback: json["url_callback"],
        paidAt: json["paid_at"],
        status: json["status"],
        postType: json["post_type"],
      );

  Map<String, dynamic> toJson() => {
        "transaction_id": transactionId,
        "user_id": userId,
        "email": email,
        "fullname": fullname,
        "address": address,
        "phone_number": phoneNumber,
        "profile_picture": profilePicture,
        "fundraise_id": fundraiseId,
        "amount": amount,
        "payment_type": paymentType,
        "virtual_account": virtualAccount,
        "url_callback": urlCallback,
        "paid_at": paidAt,
        "status": status,
        "post_type": postType,
      };
}
