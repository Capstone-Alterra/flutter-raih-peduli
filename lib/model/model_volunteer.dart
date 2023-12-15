import 'dart:convert';

ModelVolunteer modelVolunteerFromJson(Map<String, dynamic> str) =>
    ModelVolunteer.fromJson((str));

String modelVolunteerToJson(ModelVolunteer data) => json.encode(data.toJson());

class ModelVolunteer {
  List<Data> data; // Ganti tipe dari Data menjadi List<Data>
  String message;

  ModelVolunteer({
    required this.data,
    required this.message,
  });

  factory ModelVolunteer.fromJson(Map<String, dynamic> json) => ModelVolunteer(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Data {
    int id;
    int userId;
    String title;
    String description;
    List<String> skillsRequred;
    int numberOfVacancies;
    DateTime applicationDeadline;
    String contactEmail;
    String province;
    String city;
    String subDistrict;
    String detailLocation;
    String photo;
    String status;
    int totalRegistrar;
    dynamic bookmarkId;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    Data({
        required this.id,
        required this.userId,
        required this.title,
        required this.description,
        required this.skillsRequred,
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
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        skillsRequred: List<String>.from(json["skills_requred"].map((x) => x)),
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
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "description": description,
        "skills_requred": List<dynamic>.from(skillsRequred.map((x) => x)),
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
    };
}
