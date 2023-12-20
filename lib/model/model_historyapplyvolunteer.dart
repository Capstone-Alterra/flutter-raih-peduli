class HistoryApplyVolunteerModel {
  List<Datum> data;
  String message;

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
  int id;
  String email;
  String fullname;
  String address;
  String phoneNumber;
  String gender;
  String nik;
  List<String> skillsRequired;
  String resume;
  String reason;
  String photo;
  String status;
  int vacancyId;
  String vacancyName;
  String vacancyPhoto;
  DateTime createdAt;
  String postType;

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
    required this.vacancyId,
    required this.vacancyName,
    required this.vacancyPhoto,
    required this.createdAt,
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
        vacancyId: json["vacancy_id"],
        vacancyName: json["vacancy_name"],
        vacancyPhoto: json["vacancy_Photo"],
        createdAt: DateTime.parse(json["created_at"]),
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
        "vacancy_id": vacancyId,
        "vacancy_name": vacancyName,
        "vacancy_Photo": vacancyPhoto,
        "created_at": createdAt.toIso8601String(),
        "post_type": postType,
      };
}
