class ModelDetailVolunteer {
  Data data;
  String message;

  ModelDetailVolunteer({
    required this.data,
    required this.message,
  });

  factory ModelDetailVolunteer.fromJson(Map<String, dynamic> json) =>
      ModelDetailVolunteer(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  int id;
  int userId;
  String title;
  String description;
  List<String> skillsRequired;
  int numberOfVacancies;
  DateTime applicationDeadline;
  String contactEmail;
  String province;
  String city;
  String subDistrict;
  String detailLocation;
  String photo;
  String status;
  int totalRegistrants;
  dynamic bookmarkId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Data({
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
    required this.totalRegistrants,
    required this.bookmarkId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        totalRegistrants: json["total_registrants"],
        bookmarkId: json["bookmark_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
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
        "total_registrants": totalRegistrants,
        "bookmark_id": bookmarkId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
