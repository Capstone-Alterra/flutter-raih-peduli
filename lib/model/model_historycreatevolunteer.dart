import 'dart:convert';

HistoryCreateVolunteerModel historyCreateVolunteerModelFromJson(Map<String, dynamic> map) =>
    HistoryCreateVolunteerModel.fromJson(map);

String historyCreateVolunteerModelToJson(HistoryCreateVolunteerModel data) =>
    json.encode(data.toJson());

class HistoryCreateVolunteerModel {
  final List<Datum> data;
  final String message;

  HistoryCreateVolunteerModel({
    required this.data,
    required this.message,
  });

  factory HistoryCreateVolunteerModel.fromJson(Map<String, dynamic> json) =>
      HistoryCreateVolunteerModel(
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
  final int userId;
  final String title;
  final String description;
  final List<String> skillsRequired;
  final int numberOfVacancies;
  final DateTime applicationDeadline;
  final String contactEmail;
  final String province;
  final String city;
  final String subDistrict;
  final String detailLocation;
  final String photo;
  final String status;
  final int totalRegistrar;
  final dynamic bookmarkId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final String postType;

  Datum({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.skillsRequired,
    required this.numberOfVacancies,
    required this.applicationDeadline,
    required this.contactEmail,
    required this.province,
    required this.city,
    required this.subDistrict,
    required this.detailLocation,
    required this.photo,
    required this.status,
    required this.totalRegistrar,
    required this.bookmarkId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.postType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        skillsRequired:
            List<String>.from(json["skills_required"].map((x) => x)),
        numberOfVacancies: json["number_of_vacancies"],
        applicationDeadline: DateTime.parse(json["application_deadline"]),
        contactEmail: json["contact_email"],
        province: json["province"],
        city: json["city"],
        subDistrict: json["sub_district"],
        detailLocation: json["detail_location"],
        photo: json["photo"],
        status: json["status"],
        totalRegistrar: json["total_registrar"],
        bookmarkId: json["bookmark_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        postType: json["post_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "description": description,
        "skills_required": List<dynamic>.from(skillsRequired.map((x) => x)),
        "number_of_vacancies": numberOfVacancies,
        "application_deadline": applicationDeadline.toIso8601String(),
        "contact_email": contactEmail,
        "province": province,
        "city": city,
        "sub_district": subDistrict,
        "detail_location": detailLocation,
        "photo": photo,
        "status": status,
        "total_registrar": totalRegistrar,
        "bookmark_id": bookmarkId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "post_type": postType,
      };
}
