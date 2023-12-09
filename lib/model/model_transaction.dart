class ModelTransaction {
  Data data;
  String message;

  ModelTransaction({
    required this.data,
    required this.message,
  });

  factory ModelTransaction.fromJson(Map<String, dynamic> json) => ModelTransaction(
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  int transactionId;
  int userId;
  String email;
  String fullname;
  String address;
  String phoneNumber;
  String profilePicture;
  int fundraiseId;
  String fundraiseName;
  int amount;
  String paymentType;
  String virtualAccount;
  String urlCallback;
  String paidAt;
  DateTime validUntil;
  String status;

  Data({
    required this.transactionId,
    required this.userId,
    required this.email,
    required this.fullname,
    required this.address,
    required this.phoneNumber,
    required this.profilePicture,
    required this.fundraiseId,
    required this.fundraiseName,
    required this.amount,
    required this.paymentType,
    required this.virtualAccount,
    required this.urlCallback,
    required this.paidAt,
    required this.validUntil,
    required this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    transactionId: json["transaction_id"],
    userId: json["user_id"],
    email: json["email"],
    fullname: json["fullname"],
    address: json["address"],
    phoneNumber: json["phone_number"],
    profilePicture: json["profile_picture"],
    fundraiseId: json["fundraise_id"],
    fundraiseName: json["fundraise_name"],
    amount: json["amount"],
    paymentType: json["payment_type"],
    virtualAccount: json["virtual_account"],
    urlCallback: json["url_callback"],
    paidAt: json["paid_at"],
    validUntil: DateTime.parse(json["valid_until"]),
    status: json["status"],
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
  "fundraise_name": fundraiseName,
  "amount": amount,
  "payment_type": paymentType,
  "virtual_account": virtualAccount,
  "url_callback": urlCallback,
  "paid_at": paidAt,
  "valid_until": validUntil.toIso8601String(),
  "status": status,
 };
}