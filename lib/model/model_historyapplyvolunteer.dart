import 'dart:convert';

HistoryApplyVolunteerModel historyApplyVolunteerModelFromJson(Map<String, dynamic> map) =>
    HistoryApplyVolunteerModel.fromJson(map);

String historyApplyVolunteerModelToJson(HistoryApplyVolunteerModel data) =>
    json.encode(data.toJson());

class HistoryApplyVolunteerModel {
  final List<Datum> data;
  final String message;

  HistoryApplyVolunteerModel({
    required this.data,
    required this.message,
  });

  factory HistoryApplyVolunteerModel.fromJson(Map<String, dynamic> json) =>
      HistoryApplyVolunteerModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  final int id;
  final String email;
  final String fullname;
  final String address;
  final String phoneNumber;
  final String gender;
  final String nik;
  final List<String> skillsRequired;
  final String resume;
  final String reason;
  final String photo;
  final String status;
  final String postType;

  Datum({
    required this.id,
    required this.email,
    required this.fullname,
    required this.address,
    required this.phoneNumber,
    required this.gender,
    required this.nik,
    required this.skillsRequired,
    required this.resume,
    required this.reason,
    required this.photo,
    required this.status,
    required this.postType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        email: json["email"],
        fullname: json["fullname"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        nik: json["nik"],
        skillsRequired:
            List<String>.from(json["skills_required"].map((x) => x)),
        resume: json["resume"],
        reason: json["reason"],
        photo: json["photo"],
        status: json["status"],
        postType: json["post_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "fullname": fullname,
        "address": address,
        "phone_number": phoneNumber,
        "gender": gender,
        "nik": nik,
        "skills_required": List<dynamic>.from(skillsRequired.map((x) => x)),
        "resume": resume,
        "reason": reason,
        "photo": photo,
        "status": status,
        "post_type": postType,
      };
}
